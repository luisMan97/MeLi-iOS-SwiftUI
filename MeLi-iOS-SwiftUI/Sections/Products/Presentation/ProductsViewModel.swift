//
//  ProductsViewModel.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import Combine
import Observation

enum ProductsViewState {
    case intial, loading, loaded, empty, error, errorConection
}

@Observable class ProductsViewModel {

    // MARK: - Internal Observable Properties
    var state: ProductsViewState = .intial
    var products: [Products] = []
    var error = String()
    var searchText = String()
    var listType: ListType = .grid

    // MARK: - Private Properties
    private var subscriptions: Set<AnyCancellable> = []

    // Interactor
    private var getProductsUseCase: GetProductsUseCaseProtocol

    // MARK: - Initializers

    init(getProductsUseCase: GetProductsUseCaseProtocol) {
        self.getProductsUseCase = getProductsUseCase
    }

    // MARK: - Internal Methods

    func search() async {
        if searchText.count < 1 {
            self.products = []
            self.state = .intial
            return
        }
        let debouncer = Debouncer(duration: .seconds(0.5))
        guard await debouncer.sleep() else { return }
        Task { await getProducts(product: searchText) }
    }

    func getRelatedProducts(product: Products) -> [Products] {
        products.filter { $0.id != product.id }
    }

    // MARK: - Internal Methods

    @MainActor
    func getProducts(product: String) async {
        state = .loading
        let result = await getProductsUseCase.invoke(request: .init(product: product))
        switch result {
        case .success(let Products):
            self.products = Products
            self.state = Products.isEmpty ? .empty : .loaded
        case .failure(let error):
            if error == .networkError {
                self.state = .errorConection
                return
            }
            self.state = .error
            self.error = error.localizedDescription
        }
    }
}

extension ProductsViewModel {

    enum ListType {
        case grid, vertical, gridThreeColumns

        var alternatedImageName: String {
            switch self {
            case .grid: return "rectangle.grid.1x2"
            case .vertical: return "square.grid.3x2"
            case .gridThreeColumns: return "square.grid.2x2"
            }
        }

        mutating func alternateListType() {
            switch self {
            case .grid: self = .vertical
            case .vertical: self = .gridThreeColumns
            case .gridThreeColumns: self = .grid
            }
        }
    }
}
