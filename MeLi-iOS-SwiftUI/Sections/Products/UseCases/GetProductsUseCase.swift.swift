//
//  GetProductsUseCase.swift.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

protocol GetProductsUseCaseProtocol {
    func invoke(request: ProductsRequest) async -> Result<[Products], UseCaseError>
}

struct GetProductsUseCase: GetProductsUseCaseProtocol {

    // Repository
    private var repository: ProductsRepositoryProtocol

    // MARK: - Initializers

    init(repository: ProductsRepositoryProtocol) {
        self.repository = repository
    }

    // MARK: - Internal Methods

    func invoke(request: ProductsRequest) async -> Result<[Products], UseCaseError> {
        do {
            let Products = try await repository.getProducts(request: request)
            return .success(Products)
        } catch {
            return .failure(ServiceError.handleError(error))
        }
    }
}
