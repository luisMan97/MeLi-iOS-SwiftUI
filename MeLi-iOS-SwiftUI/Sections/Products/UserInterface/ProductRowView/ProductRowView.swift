//
//  ProductRowView.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import SwiftUI

struct ProductRowView: View {
    let product: Products
    let configuration: Configuration

    var body: some View {
        switch configuration.alignment {
        case .horizontal: horizontalBodyView
        case .vertical: verticalBodyView
        }
    }
}

// MARK: - Private views
private extension ProductRowView {
    var horizontalBodyView: some View {
        VStack {
            HStack {
                bodyView
            }
            Divider()
        }
        .padding(.horizontal, 8)
        .background(Color.white)
    }

    private var verticalBodyView: some View {
        VStack {
            bodyView
        }
        .padding(.horizontal, 8)
        .background(Color.white)
        .frame(maxWidth: .infinity)
        .frame(height: 250)
        .border(.gray,
                 width: 0.2)
    }

    @ViewBuilder
    var bodyView: some View {
        image
        contentView
        Spacer()
    }

    var image: some View {
        AsyncImage(url: product.imageUrl) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            CartEmptyStateView()
        }
        .frame(100)
    }

    var contentView: some View {
        VStack(alignment: .leading) {
            originalPrice
            price
            title
        }
    }

    @ViewBuilder
    var originalPrice: some View {
        if let originalPrice = product.originalPrice {
            formatedPrice(price: originalPrice)
                .lineLimit(1)
                .font(.title3)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity,
                        alignment: .leading)
        }
    }

    var price: some View {
        formatedPrice(price: product.price)
            .lineLimit(1)
            .font(.title3)
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity,
                    alignment: .leading)
    }

    var title: some View {
        Text(product.title)
            .font(.body)
            .foregroundStyle(.gray)
            .frame(maxWidth: .infinity,
                    alignment: .leading)
    }

    @ViewBuilder
    func formatedPrice(price: Double) -> some View {
        Text(price,
              format: .currency(code: "COP"))
    }
}

#Preview {
    ProductRowView(product: Products.mock(), configuration: .init())
}
