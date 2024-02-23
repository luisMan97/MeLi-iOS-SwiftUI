//
//  ProductsResponse.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

struct ProductsResponse: Decodable {
    let id: String
    let title: String
    let thumbnail: String
    let price: Double
    let originalPrice: Double?
    let permalink: String
}

extension ProductsResponse {
    func toDomain() -> Products {
        .init(id: id,
               title: title,
               thumbnail: thumbnail,
               price: price,
               originalPrice: originalPrice,
               permalink: permalink)
    }
}
