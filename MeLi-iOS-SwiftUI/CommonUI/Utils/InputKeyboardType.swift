//
//  InputKeyboardType.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import SwiftUI

public enum InputKeyboardType {
    case `default`
    case number
    case email

    public var keyboard: UIKeyboardType {
        switch self {
        case .`default`: return .default
        case .email: return .emailAddress
        case .number: return .numberPad
        }
    }

    public var textAlignment: TextAlignment { .leading }
}
