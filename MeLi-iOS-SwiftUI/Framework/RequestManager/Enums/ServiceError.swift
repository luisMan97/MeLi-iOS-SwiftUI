//
//  ServiceError.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import Foundation

enum ServiceError: Error {
    case badUrl, requestError, decodingError, statusNotOK

    static func handleError(_ error: Error) -> UseCaseError {
        debugError(error)
        switch(error) {
        case URLError.notConnectedToInternet: return .networkError
        default: return .decodingError
        }
    }


    private static func debugError(_ error: Error) {
        #if DEBUG
            print("❌ \(error.localizedDescription)")
        #endif
    }
}
