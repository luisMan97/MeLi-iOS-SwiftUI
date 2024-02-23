//
//  ProductsFactory.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

enum ProductsFactory {

    static func getProductsView() -> ProductsView {
        // DataSources
        let dataSource = ProductsURLSessionDataSource(apiManager: APIManager())
        // Repository
        let repository = ProductsRepository(dataSource: dataSource)
        // Interactor
        let getProductsUseCase = GetProductsUseCase(repository: repository)
        // ViewModel
        let viewModel = ProductsViewModel(getProductsUseCase: getProductsUseCase)
        return ProductsView(viewModel: viewModel)
    }
}
