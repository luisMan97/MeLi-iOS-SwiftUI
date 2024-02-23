//
//  SearchField.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import SwiftUI

public struct SearchField: View {
    typealias Layout = SearchFieldLayout
    private let configuration: SearchFieldConfiguration

    @State private var editing: Bool = false

    public init(configuration: SearchFieldConfiguration) {
        self.configuration = configuration
    }

    private var lineColor: Color { editing ? .primaryYellow : .white }

    public var body: some View {
        search
            .onTapGesture { configuration.tapSearch() }
            .cornerRadius(Layout.cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: Layout.cornerRadius)
                    .stroke(
                        lineColor,
                        lineWidth: Layout.borderwidth
                    )
            )
            .shadow(color: .shadow.opacity(Layout.shadowColorOpacity),
                     radius: Layout.shadowRadius,
                     x: .zero,
                     y: Layout.shadowVertical)
    }

    public var search: some View {
        HStack(spacing: Layout.containerStackSpacing) {
            searchIcon
            TextField(String.empty,
                        text: configuration.text,
                        onEditingChanged: { editing in self.editing = editing })
            .placeholder(when: configuration.text.wrappedValue.isEmpty) {
                Text(configuration.placeholderText)
                    .foregroundColor(.blackIntermediate)
            }
            .keyboardType(.default)
            .submitLabel(.search)
            .onSubmit {
                UIImpactFeedbackGenerator.executeImpact()
                self.configuration.onSubmit()
            }
            if !configuration.text.wrappedValue.isEmpty && configuration.showCleanButton {
                cleanButton
            }
        }
        .padding(.leading, Layout.containerLeadingPadding)
        .padding(.vertical, Layout.containerVerticalPadding)
        .background(.white)
        .font(.system(size: Layout.textFontSize))
        .keyboardType(configuration.inputKeyboardType.keyboard)
        .multilineTextAlignment(configuration.inputKeyboardType.textAlignment)
    }

    private var searchIcon: some View {
        configuration.iconImage
            .resizable()
            .scaledToFit()
            .frame(Layout.searchIconSize)
            .foregroundColor(.blackIntermediate)
    }

    private var cleanButton: some View {
        Button(action: clearText, label: { cleanIcon })
            .padding(.trailing, Layout.cleanButtonLeadingPadding)
    }

    private var cleanIcon: some View {
        Image(systemName: "xmark")
            .resizable()
            .scaledToFit()
            .frame(Layout.cleanIconSize)
            .foregroundColor(.black)
    }

    private func clearText() {
        configuration.text.wrappedValue = .empty
    }
}

public struct SearchFieldConfiguration {
    public var text: Binding<String>
    public var placeholderText: String
    public var showCleanButton: Bool
    public var inputKeyboardType: InputKeyboardType
    public var iconImage: Image
    public var tapSearch: CompletionHandler
    public var onSubmit: CompletionHandler

    public init(text: Binding<String>,
                  placeholderText: String,
                  showCleanButton: Bool = true,
                  inputKeyboardType: InputKeyboardType = .default,
                  iconImage: Image = Image(systemName: "magnifyingglass"),
                  tapSearch: @escaping CompletionHandler = {},
                  onSubmit: @escaping CompletionHandler = {}) {
        self.text = text
        self.placeholderText = placeholderText
        self.showCleanButton = showCleanButton
        self.inputKeyboardType = inputKeyboardType
        self.iconImage = iconImage
        self.tapSearch = tapSearch
        self.onSubmit = onSubmit
    }
}

enum SearchFieldLayout {
    static let cornerRadius: CGFloat = 30
    static let borderwidth: CGFloat = 0.5
    static let shadowColorOpacity: CGFloat = 0.2
    static let shadowRadius: CGFloat = 1
    static let shadowVertical: CGFloat = 2
    // containerStack
    static let containerStackSpacing: CGFloat = 16
    static let containerLeadingPadding: CGFloat = 24
    static let containerVerticalPadding: CGFloat = 8
    // text
    static let textFontSize: CGFloat = 14
    // searchIcon
    static let searchIconSize: CGFloat = 10
    // cleanButton
    static let cleanButtonLeadingPadding: CGFloat = 16
    static let cleanIconSize: CGFloat = 10
}

#Preview {
    SearchField(
        configuration: .init(
            text: .constant(.empty),
            placeholderText: "Search"
        )
    )
}
