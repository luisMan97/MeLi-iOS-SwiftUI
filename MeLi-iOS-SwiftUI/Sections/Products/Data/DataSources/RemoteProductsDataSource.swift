//
//  RemoteProductsDataSource.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

protocol RemoteProductsDataSource { 
    func getProducts(request: ProductsRequest) async throws -> [Products]
}
