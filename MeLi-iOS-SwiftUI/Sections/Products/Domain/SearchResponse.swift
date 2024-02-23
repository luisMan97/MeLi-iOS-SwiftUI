//
//  SearchResponse.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import Foundation

struct SearchResponse: Decodable {
    let results: [ProductsResponse]
}

extension SearchResponse {
    func toProducts() -> [Products] { results.map { $0.toDomain() } }
}
