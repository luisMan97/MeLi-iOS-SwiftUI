//
//  APIRouter.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import Foundation

enum APIRouter {

    case Products(Encodable)

    private var method: HTTPMethod {
        switch self {
        case .Products:
            return .get
        }
    }

    private var path: String {
        switch self {
        case .Products(let model):
            return "MCO/search".queryString(params: model.dictionary ?? [:])
        }
    }

    private var url: String { APIConstants.endpoint }

    private var urlRequest: URLRequest? {
        guard let nsUrl = NSURL(string: self.url + path) else { return nil }
        var urlRequest = URLRequest(url: nsUrl as URL)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = APIManager.defaultHeaders as? [String: String]
        return urlRequest
    }

    var request: URLRequest? {
        switch self {
        case .Products:
            return urlRequest
        }
    }
}

