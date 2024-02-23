//
//  GetProductsUseCaseTests.swift
//  MeLi-iOS-SwiftUITests
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

@testable import MeLi_iOS_SwiftUI
import XCTest

class GetProductsUseCaseTests: XCTestCase {

    private var repository: ProductsRepositoryMock!
    private var useCase: GetProductsUseCase!

    override func setUp() {
        repository = ProductsRepositoryMock()
        useCase = .init(repository: repository)
    }

    func testGetProducts() async {
        // Given
        let expectedValue = [Products.mock()]
        repository.executeInputResult = expectedValue
        // When
        let response = await useCase.invoke(request: .init(product: .empty))
        // Then
        XCTAssertEqual(response, .success(expectedValue))
    }

    func testGetProductsError() async {
        // Given
        repository.executeInputResult = nil
        // When
        let response = await useCase.invoke(request: .init(product: .empty))
        // Then
        XCTAssertEqual(response, .failure(UseCaseError.decodingError))
    }
}
