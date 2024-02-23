//
//  CartEmptyStateView.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import SwiftUI

struct CartEmptyStateView: View {
    var size: CGFloat = 50

    var body: some View {
        Image(systemName: "suitcase.cart.fill")
            .symbolRenderingMode(.hierarchical)
            .foregroundStyle(.linearGradient(colors: [.gray.opacity(0.6), .gray.opacity(0.3)], startPoint: .top, endPoint: .bottomLeading))
            .font(.system(size: size))
            .padding(25)
    }
}

#Preview {
    CartEmptyStateView()
}
