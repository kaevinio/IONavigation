//
//  NavigationItem.swift
//  
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct NavigationItem: ViewModifier {
    
    // MARK: - Variables
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
    @State private var isHovering = false
    
    let text: String?
    let font: Font
    let image: Image?
    let foregroundColor: Color
    let backgroundColor: Color
    let disabled: Bool
    let tooltip: String?
    let action: () -> Void
    
    
    
    // MARK: - Body
    
    public func body(content: Content) -> some View {
        HStack(spacing: 0) {
            content
            
            if let text {
                Button(action: action) {
                    Text(text)
                        .font(font)
                        .foregroundStyle(foregroundColor)
                        .padding(.vertical, Values.minorPadding / 4)
                        .padding(.horizontal, Values.minorPadding)
                        .background(isHovering ? backgroundColor.opacity(0.1) : backgroundColor.opacity(1))
                        .clipShape(Capsule())
                }
                .frame(height: Values.navigationBarHeight)
                .padding(.trailing, Values.middlePadding)
                .buttonStyle(.plain)
                .fixedSize()
                #if os(iOS)
                .padding(.top, horizontalSizeClass == .compact ? 0 : Values.minorPadding)
                #else
                .padding(.top, Values.middlePadding)
                #endif
                .onHover { isHovering = $0 }
                .help(tooltip ?? "")
                .disabled(disabled)
            } else if let image {
                NavigationBarButton(icon: image, font: font, color: foregroundColor, action: action)
                    .padding(.trailing, Values.minorPadding)
                    #if os(iOS)
                    .padding(.top, horizontalSizeClass == .compact ? 0 : Values.minorPadding)
                    #else
                    .padding(.top, Values.middlePadding)
                    #endif
                    .help(tooltip ?? "")
                    .disabled(disabled)
            }
        }
    }
    
}

extension View {
    public func navigationItem(text: String? = nil, font: Font = .headline, image: Image? = nil, foregroundColor: Color = .primary, backgroundColor: Color = .clear, disabled: Bool = false, tooltip: String? = nil, action: @escaping () -> Void) -> some View {
        modifier(NavigationItem(text: text, font: font, image: image, foregroundColor: foregroundColor, backgroundColor: backgroundColor, disabled: disabled, tooltip: tooltip, action: action))
    }
}
