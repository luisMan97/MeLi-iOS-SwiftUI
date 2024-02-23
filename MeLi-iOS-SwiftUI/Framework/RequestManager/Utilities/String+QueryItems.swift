//
//  String+QueryItems.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import Foundation

extension String {

    func queryString(params: [String: Any]) -> String {
        var components = URLComponents(string: self)
        components?.setQueryItems(with: params)
        return components?.url?.absoluteString ?? self
    }
}
