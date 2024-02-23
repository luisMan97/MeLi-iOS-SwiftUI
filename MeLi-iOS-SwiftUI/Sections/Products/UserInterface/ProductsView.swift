//
//  ProductsView.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import SwiftUI

struct ProductsView: View {

    @State var viewModel: ProductsViewModel

    var body: some View {
        NavigationStack {
            VStack {
                searchField
                switch viewModel.state {
                case .intial: initialView
                case .loading: skeletonListView
                case .loaded: listView
                case .empty: emptyView
                case .error: errorView
                case .errorConection: internetErrorView
                }
            }
            .background(Color.primaryYellow)
            .onChange(of: viewModel.searchText) { Task  { await viewModel.search() } }
            .navigationDestination(for: Products.self) { product in
                ProductDetailView(product: product,
                                  relatedProducts: viewModel.getRelatedProducts(product: product))
            }
        }
        .tint(.white)
    }
}

// MARK: - Private views
private extension ProductsView {
    var searchField: some View {
        SearchField(configuration: .init(text: $viewModel.searchText,
                                         placeholderText: .search))
        .padding(.horizontal)
    }

    var initialView: some View {
        AlertView(configuration: .init(imageName: .cart,
                                            imageColor: .yellow,
                                            text: .initialState))
        .padding(.top)
        .background(Color.primaryGray)
    }

    var skeletonListView: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.flexible(), spacing: .zero), GridItem(.flexible())],
                      spacing: .gridSpacing) {
                ForEach(0..<10) { _ in
                    ProductRowSkeletonView()
                }
            }
        }
        .padding(.horizontal)
        .background(Color.primaryGray)
    }

    var listView: some View {
        VStack {
            selectListTypeView
                .padding(.bottom,
                          .selectListTypeViewBottomPadding)
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns,
                          spacing: .gridSpacing) {
                    getProductsView(configuration: .init(alignment: aligment))
                }
            }
        }
        .padding(.top)
        .padding(.horizontal)
        .background(Color.primaryGray)
    }

    var selectListTypeView: some View {
        HStack {
            Spacer()
            Button(action: { viewModel.listType.alternateListType() }, label: {
                Image(systemName: viewModel.listType.alternatedImageName)
                    .frame(.selectListTypeViewImageSize)
            })
            .foregroundColor(Color.black)
            .padding(.trailing)
        }
    }

    var emptyView: some View {
        AlertView(configuration: .init(imageName: .cartBadgeQuestionmark,
                                            text: .emptyState))
        .padding(.top)
        .background(Color.primaryGray)
    }

    var errorView: some View {
        AlertView(configuration: .init(imageName: .xCircle,
                                            imageColor: .red,
                                            text: .errorState))
        .padding(.top)
        .background(Color.primaryGray)
    }

    var internetErrorView: some View {
        AlertView(configuration: .init(imageName: .wifiExclamationmark,
                                            imageColor: .blue,
                                            text: .internetErrorState))
        .padding(.top)
        .background(Color.primaryGray)
    }

    func getProductsView(configuration: ProductRowView.Configuration) -> some View {
        ForEach(viewModel.products) { product in
            NavigationLink(value: product) {
                ProductRowView(product: product,
                                  configuration: configuration)
            }
        }
    }
}

// MARK: - Shortcuts
private extension ProductsView {
    var columns: [GridItem] {
        switch viewModel.listType {
        case .grid: [GridItem(.flexible(), spacing: .zero), GridItem(.flexible())]
        case .vertical: [GridItem(.flexible())]
        case .gridThreeColumns: [GridItem(.flexible(), spacing: .zero), GridItem(.flexible(), spacing: .zero), GridItem(.flexible())]
        }
    }

    var aligment: ProductRowView.Alignment {
        viewModel.listType == .vertical ? .horizontal : .vertical
    }
}

// MARK: - String constants
private extension String {
    static let search: String = String(localized: "search")
    static let initialState: String = String(localized: "initial.state")
    static let emptyState: String = String(localized: "empty.state")
    static let errorState: String = String(localized: "error.state")
    static let internetErrorState: String = String(localized: "intenet.error.state")
    static let cart = "cart"
    static let cartBadgeQuestionmark = "cart.badge.questionmark"
    static let xCircle = "x.circle"
    static let wifiExclamationmark = "wifi.exclamationmark"
}

// MARK: - Layout constants
private extension CGFloat {
    static let gridSpacing: CGFloat = .zero
    static let selectListTypeViewBottomPadding: CGFloat = 8
    static let selectListTypeViewImageSize: CGFloat = 10
}

#Preview {
    ProductsFactory.getProductsView()
}
