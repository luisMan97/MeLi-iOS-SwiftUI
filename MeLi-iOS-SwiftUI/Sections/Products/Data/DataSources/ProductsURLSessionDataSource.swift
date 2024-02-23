//
//  ProductsURLSessionDataSource.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

struct ProductsURLSessionDataSource: RemoteProductsDataSource {

    private(set) var apiManager: APIManagerProtocol

    func getProducts(request: ProductsRequest) async throws -> [Products] {
        try await (apiManager.request(service: .Products(request)) as SearchResponse).toProducts()
    }
}
