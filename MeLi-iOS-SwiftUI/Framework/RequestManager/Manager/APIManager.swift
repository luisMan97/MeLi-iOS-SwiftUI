//
//  APIManager.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import Foundation

protocol APIManagerProtocol {
    func request<T: Decodable>(service: APIRouter) async throws -> T
}

struct APIManager {

    static var defaultHeaders: NSMutableDictionary = ["Content-Type": "application/json"]
}

// MARK: - Data Request Methods
extension APIManager: APIManagerProtocol {

    func request<T: Decodable>(service: APIRouter) async throws -> T {
        guard let request = service.request else { throw URLError(.badURL) }
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
}

