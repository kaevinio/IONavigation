//
//  NavigationItem.swift
//  
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct NavigationItem: ViewModifier {
    
    public func body(content: Content) -> some View {
        HStack(alignment: .bottom, spacing: 0) {
            content
            
            if let text {
                Button(action: action) {
                    Text(text)
                        .font(font)
                        .foregroundColor(color)
                        .padding(Values.middlePadding / 2)
                        .background(isHovering ? color.opacity(0.1) : color.opacity(0))
                        .cornerRadius(Values.cornerRadius)
                }
                .frame(height: Values.navigationBarHeight)
                .padding(.trailing, Values.minorPadding)
                .disabled(disabled)
                .buttonStyle(.plain)
                .fixedSize()
                #if os(iOS)
                .padding(.top, horizontalSizeClass == .compact ? 0 : Values.minorPadding)
                #else
                .padding(.top, Values.middlePadding)
                #endif
                .onHover { isHovering = $0 }
                .help(tooltip ?? "")
            } else if let image {
                NavigationBarButton(icon: image, font: font, color: color, action: action)
                    .padding(.trailing, Values.minorPadding)
                    #if os(iOS)
                    .padding(.top, horizontalSizeClass == .compact ? 0 : Values.minorPadding)
                    #else
                    .padding(.top, Values.middlePadding)
                    #endif
                    .help(tooltip ?? "")
            }
        }
    }
    
    
    
    // MARK: - Variables
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
    @State private var isHovering = false
    
    let text: String?
    let font: Font
    let image: Image?
    let color: Color
    let disabled: Bool
    let tooltip: String?
    let action: () -> Void
    
}

extension View {
    public func navigationItem(text: String? = nil, font: Font = .title2, image: Image? = nil, color: Color = .primary, disabled: Bool = false, tooltip: String? = nil, action: @escaping () -> Void) -> some View {
        modifier(NavigationItem(text: text, font: font, image: image, color: color, disabled: disabled, tooltip: tooltip, action: action))
    }
}
