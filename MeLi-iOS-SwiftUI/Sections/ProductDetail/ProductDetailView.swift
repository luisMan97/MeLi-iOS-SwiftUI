//
//  ProductDetailView.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Products
    let relatedProducts: [Products]

    var body: some View {
        ZStack {
            backgroundColor
            VStack {
                title
                image
                price
                showMore
                relatedProductsView
                Spacer()
            }
            .padding(.horizontal, 8)
            .background(Color.white)
            .padding(.top, 1)
        }
        .toolbarRole(.editor)
    }
}

// MARK: - Private views
private extension ProductDetailView {
    var backgroundColor: some View {
        Color.primaryYellow
            .edgesIgnoringSafeArea(.top)
    }

    var title: some View {
        Text(product.title)
            .font(.body)
            .foregroundStyle(.gray)
            .frame(maxWidth: .infinity,
                    alignment: .leading)
            .padding(.top)
    }

    var image: some View {
        AsyncImage(url: product.imageUrl) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            CartEmptyStateView()
        }
        .frame(200)
    }

    var price: some View {
        formatedPrice(price: product.price)
            .lineLimit(1)
            .font(.title3)
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity,
                    alignment: .leading)
    }

    var showMore: some View {
        NavigationLink {
            webView(url: product.permalinkUrl)
        } label: {
            Text(String(localized: "seemore"))
                .foregroundStyle(.blue)
                .bold()
        }
    }

    var relatedProductsView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: .zero) {
                ForEach(relatedProducts) { product in
                    NavigationLink {
                        webView(url: product.permalinkUrl)
                    } label: {
                        ProductRowView(product: product,
                                          configuration: .init())
                            .frame(width: 150, height: 250)
                            .padding(.leading)
                    }
                }
            }
        }.frame(height: 300)
    }

    @ViewBuilder
    func webView(url: URL?) -> some View {
        LoadingWebView(url: url, 
                          contentView: { ProductDetailSkeletonView() })
            .background(Color.primaryYellow)
            .toolbarRole(.editor)
    }

    @ViewBuilder
    func formatedPrice(price: Double) -> some View {
        Text(price,
              format: .currency(code: "COP"))
    }
}

#Preview {
    ProductDetailView(product: Products.mock(), relatedProducts: [Products.mock()])
}
