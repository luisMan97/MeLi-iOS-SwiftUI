//
//  Encodable+Data.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import Foundation

extension Encodable {

    func toJSONData() -> Data? { try? JSONEncoder().encode(self) }
}
