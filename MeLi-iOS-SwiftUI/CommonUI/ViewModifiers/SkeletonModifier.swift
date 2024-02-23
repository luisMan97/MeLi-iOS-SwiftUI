//
//  SkeletonModifier.swift
//  MeLi-iOS-SwiftUI
//
//  Created by Jorge Luis Rivera Ladino on 22/02/24.
//  Copyright © 2024 Desays Cod. All rights reserved.
//

import SwiftUI

struct SkeletonModifier: ViewModifier {
    var isLoading: Bool
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat

    @State private var progress: CGFloat = .zero
    private let gradient1 = Gradient(colors: [.gray.opacity(0.1), .white])
    private let gradient2 = Gradient(colors: [.white, .gray.opacity(0.1)])
    private let constants = Constants()

    func body(content: Content) -> some View {
        ZStack {
            content
            if isLoading {
                Rectangle()
                    .animatableGradient(fromGradient: gradient2,
                                        toGradient: gradient1,
                                        progress: progress)
                    .frame(width: width,
                           height: height)
                    .cornerRadius(cornerRadius)
                    .onAppear {
                        withAnimation(
                            Animation
                                .linear(duration: constants.duration)
                                .repeatForever()
                        ) {
                            self.progress = .progressAnimation
                        }
                    }.onDisappear {
                        progress = .zero
                    }
            }
        }
    }
}

// MARK: - Layout constants
private extension CGFloat {
    static let progressAnimation: CGFloat = 1
}

private extension SkeletonModifier {
    struct Constants {
        let duration: Double = 1
    }
}

public extension View {
    func skeleton(isLoading: Bool,
                  width: CGFloat,
                  height: CGFloat,
                  cornerRadius: CGFloat) -> some View {
        modifier(SkeletonModifier(isLoading: isLoading,
                                  width: width,
                                  height: height,
                                  cornerRadius: cornerRadius))
    }
}

#Preview {
    EmptyView()
        .skeleton(isLoading: true, width: 100, height: 100, cornerRadius: 20)
}


struct AnimatableGradientModifier: AnimatableModifier {
    let fromGradient: Gradient
    let toGradient: Gradient
    var progress: CGFloat = 0.0

    func body(content: Content) -> some View {
        var gradientColors: [Color] = []
        for index in 0..<fromGradient.stops.count {
            let fromColor = UIColor(fromGradient.stops[index].color)
            let toColor = UIColor(toGradient.stops[index].color)
            gradientColors.append(colorMixer(fromColor: fromColor,
                                             toColor: toColor,
                                             progress: progress))
        }
        return LinearGradient(gradient: Gradient(colors: gradientColors),
                              startPoint: .leading,
                              endPoint: .trailing)
    }

    func colorMixer(fromColor fColor: UIColor,
                    toColor sColor: UIColor,
                    progress: CGFloat) -> Color {
        guard let fromColor = fColor.cgColor.components else { return Color(fColor) }
        guard let toColor = sColor.cgColor.components else { return Color(sColor) }
        let red = fromColor[0] + (toColor[0] - fromColor[0]) * progress
        let green = fromColor[1] + (toColor[1] - fromColor[1]) * progress
        let blue = fromColor[2] + (toColor[2] - fromColor[2]) * progress
        return Color(red: Double(red),
                     green: Double(green),
                     blue: Double(blue))
    }
}

public extension View {
    func animatableGradient(fromGradient: Gradient,
                            toGradient: Gradient,
                            progress: CGFloat) -> some View {
        modifier(AnimatableGradientModifier(fromGradient: fromGradient,
                                            toGradient: toGradient,
                                            progress: progress))
    }
}
