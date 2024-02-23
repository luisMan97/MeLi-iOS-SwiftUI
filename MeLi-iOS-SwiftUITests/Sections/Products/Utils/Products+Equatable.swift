//
//  Products+Equatable.swift
//  MeLi-iOS-SwiftUITests
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

@testable import MeLi_iOS_SwiftUI

extension Products {

    public static func == (lhs: Products, rhs: Products) -> Bool {
        lhs.id == rhs.id
    }
}
