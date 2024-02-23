//
//  GetProductsUseCaseMock.swift
//  MeLi-iOS-SwiftUITests
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

@testable import MeLi_iOS_SwiftUI

class GetProductsUseCaseMock: GetProductsUseCaseProtocol {

    var executeResult: Result<[Products], UseCaseError> = .success([Products.mock()])

    func invoke(request: ProductsRequest) async -> Result<[Products], UseCaseError> {
        executeResult
    }
}
