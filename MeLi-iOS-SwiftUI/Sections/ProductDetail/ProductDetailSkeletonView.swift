//
//  ProductDetailSkeletonView.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import SwiftUI

struct ProductDetailSkeletonView: View {
    var body: some View {
        VStack(alignment: .leading,
                spacing: 10) {
            EmptyView()
                .skeleton(isLoading: true, width: 150, height: 18, cornerRadius: 20)
                .padding(.top, 60)
            EmptyView()
                .skeleton(isLoading: true, width: 100, height: 18, cornerRadius: 20)
            CartEmptyStateView(size: UIScreen.main.bounds.width * 0.5)
            EmptyView()
                .skeleton(isLoading: true, width: 100, height: 18, cornerRadius: 20)
            EmptyView()
                .skeleton(isLoading: true, width: 80, height: 18, cornerRadius: 20)
            Spacer()
        }
    }
}

#Preview {
    ProductDetailSkeletonView()
}
