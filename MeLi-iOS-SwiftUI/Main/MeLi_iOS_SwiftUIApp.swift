//
//  MeLi_iOS_SwiftUIApp.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 20/02/24.
//

import SwiftUI
import SwiftData

@main
struct MeLi_iOS_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ProductsFactory.getProductsView()
        }
    }
}
