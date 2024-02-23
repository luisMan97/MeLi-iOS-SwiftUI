//
//  ProductsRepository.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

protocol ProductsRepositoryProtocol {
    func getProducts(request: ProductsRequest) async throws -> [Products]
}

struct ProductsRepository: ProductsRepositoryProtocol {

    private var dataSource: RemoteProductsDataSource

    init(dataSource: RemoteProductsDataSource) {
        self.dataSource = dataSource
    }

    func getProducts(request: ProductsRequest) async throws -> [Products] {
        return try await dataSource.getProducts(request: request)
    }
}
