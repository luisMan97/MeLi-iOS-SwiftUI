//
//  ProductsViewModelTests.swift
//  MeLi-iOS-SwiftUITests
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

@testable import MeLi_iOS_SwiftUI
import XCTest

class ProductsViewModelTests: XCTestCase {

    private var viewModel: ProductsViewModel!
    private var getProductsUseCase: GetProductsUseCaseMock!

    override func setUp() {
        getProductsUseCase = GetProductsUseCaseMock()
        viewModel = ProductsViewModel(getProductsUseCase: getProductsUseCase)
    }

    func testGetProducts() async {
        let expectedValue = [Products.mock()]
        getProductsUseCase.executeResult = .success(expectedValue)
        await viewModel.getProducts(product: .empty)
        XCTAssertEqual(viewModel.products, expectedValue)
    }

    func testGetProductsError() async {
        getProductsUseCase.executeResult = .failure(UseCaseError.decodingError)
        await viewModel.getProducts(product: .empty)
        XCTAssertEqual(viewModel.error, UseCaseError.decodingError.localizedDescription)
    }
}
