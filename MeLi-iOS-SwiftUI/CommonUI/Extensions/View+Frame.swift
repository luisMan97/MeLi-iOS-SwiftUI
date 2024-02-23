//
//  View+Frame.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import SwiftUI

extension View {
    @ViewBuilder
    func frame(_ length: CGFloat) -> some View {
        frame(width: length, height: length)
    }
}
