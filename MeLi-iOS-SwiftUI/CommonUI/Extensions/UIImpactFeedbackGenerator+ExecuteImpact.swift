//
//  UIImpactFeedbackGenerator+ExecuteImpact.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import SwiftUI

public extension UIImpactFeedbackGenerator {
    static func executeImpact(_ style: UIImpactFeedbackGenerator.FeedbackStyle = .heavy) {
        let impact: UIImpactFeedbackGenerator = .init(style: style)
        impact.impactOccurred()
    }
}
