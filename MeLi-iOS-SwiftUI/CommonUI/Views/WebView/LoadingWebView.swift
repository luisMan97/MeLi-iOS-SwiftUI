//
//  LoadingWebView.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import SwiftUI

struct LoadingWebView<Content>: View where Content: View {

    let url: URL?
    var contentView: ContentCompletionHandler<Content>

    @State private var isLoading = true

    var body: some View {
        if let url = url {
            ZStack {
                WebView(url: url,
                         isLoading: $isLoading)
                if isLoading {
                    Color.white
                    contentView()
                }
            }
        }
    }
}
