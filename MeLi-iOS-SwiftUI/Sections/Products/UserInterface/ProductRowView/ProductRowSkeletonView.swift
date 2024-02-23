//
//  ProductRowSkeletonView.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import SwiftUI

struct ProductRowSkeletonView: View {
    var body: some View {
        VStack(spacing: 10) {
            CartEmptyStateView()
            EmptyView()
                .skeleton(isLoading: true, width: 100, height: 18, cornerRadius: 20)
                .frame(maxWidth: .infinity)
            EmptyView()
                .skeleton(isLoading: true, width: 100, height: 18, cornerRadius: 20)
                .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 8)
        .frame(maxWidth: .infinity)
        .frame(height: 250)
        .background(Color.white)
        .border(.gray,
                 width: 0.2)
    }
}

#Preview {
    ProductRowSkeletonView()
}
