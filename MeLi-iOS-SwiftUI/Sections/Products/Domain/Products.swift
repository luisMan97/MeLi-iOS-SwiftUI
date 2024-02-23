//
//  Products.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import Foundation

struct Products: Identifiable, Hashable {
    let id: String
    let title: String
    let thumbnail: String
    let price: Double
    let originalPrice: Double?
    let permalink: String

    var imageUrl: URL? { .init(string: thumbnail.replacingOccurrences(of: "http:", with: "https:")) }
    var permalinkUrl: URL? { .init(string: permalink) }
}

#if DEBUG
extension Products {
    static func mock(id: String = "MCO1395029535",
                        title: String = "Renault Sandero 1.6 Dynamique 2011",
                        thumbnail: String = "http://http2.mlstatic.com/D_964839-MCO74673577635_022024-I.jpg",
                        price: Double = 24_000_000,
                        originalPrice: Double? = nil,
                        permalink: String = "https://carro.mercadolibre.com.co/MCO-1395029535-renault-sandero-16-dynamique-2011-_JM") -> Self {
        .init(id: id,
               title: title,
               thumbnail: thumbnail,
               price: price, 
               originalPrice: originalPrice,
               permalink: permalink)
    }
}
#endif
