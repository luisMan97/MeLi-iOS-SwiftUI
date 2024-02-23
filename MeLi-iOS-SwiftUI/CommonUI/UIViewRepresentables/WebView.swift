//
//  WebView.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    private let url: URL
    @Binding private var isLoading: Bool

    internal init(url: URL, isLoading: Binding<Bool>) {
        self.url = url
        self._isLoading = isLoading
    }

    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        view.navigationDelegate = context.coordinator
        view.scrollView.showsVerticalScrollIndicator = false
        view.load(URLRequest(url: url))
        return view
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

extension WebView {
    class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate {
        var parent: WebView

        init(_ parent: WebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            parent.isLoading = true
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.isLoading = false
        }

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            parent.isLoading = false
        }
    }
}
