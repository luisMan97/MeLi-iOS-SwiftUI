//
//  URLComponents+QueryItems.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import Foundation

extension URLComponents {

    mutating func setQueryItems(with parameters: [String: Any]) {
        queryItems = parameters.map { .init(name: $0.key, value: $0.value as? String) }
    }
}
