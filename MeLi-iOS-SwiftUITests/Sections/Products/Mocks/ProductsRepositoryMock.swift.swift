//
//  ProductsRepositoryMock.swift.swift
//  MeLi-iOS-SwiftUITests
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

@testable import MeLi_iOS_SwiftUI

class ProductsRepositoryMock: ProductsRepositoryProtocol {

    var executeInputResult: [Products]!

    private var executeOutputResult: [Products] {
        get throws { return try ProductsResult() }
    }

    func getProducts(request: ProductsRequest) async throws -> [Products] {
        try executeOutputResult
    }

    private func ProductsResult() throws -> [Products] {
        if let executeInputResult {
            return executeInputResult

        }
        throw ServiceError.decodingError
    }
}
