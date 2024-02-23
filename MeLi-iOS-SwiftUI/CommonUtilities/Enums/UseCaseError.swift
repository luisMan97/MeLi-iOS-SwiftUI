//
//  UseCaseError.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

enum UseCaseError: Error {
    case networkError, decodingError

    public var localizedDescription: String {
        switch self {
        case .networkError:
            return "Verifica tu conexión a internet e intenta nuevamente."
        case .decodingError:
            return "Ha ocurrido un error, inténtalo en unos minutos."
        }
    }
}
