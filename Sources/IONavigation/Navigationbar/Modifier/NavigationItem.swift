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
            
            Button(action: action) {
                if let text = text {
                    Text(text)
                        .font(.system(size: 16, weight: boldText ?? true ? .semibold : .regular))
                        .foregroundColor(color)
                        .padding(Values.middlePadding / 2)
                        .background(isHovering ? color.opacity(0.1) : color.opacity(0))
                        .cornerRadius(Values.cornerRadius)
                } else if let image = image {
                    image
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(color)
                        .frame(width: Values.navigationItemSize, height: Values.navigationItemSize)
                        .padding(Values.middlePadding / 2)
                        .background(isHovering ? color.opacity(0.1) : color.opacity(0))
                        .cornerRadius(Values.cornerRadius)
                }
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
            .onHover { hovering in
                self.isHovering = hovering
            }
        }
    }
    
    
    
    // MARK: - Variables
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
    @State private var isHovering = false
    
    let text: String?
    let boldText: Bool?
    let image: Image?
    let color: Color
    let disabled: Bool
    let action: () -> Void
    
}

extension View {
    public func navigationItem(text: String? = nil, boldText: Bool? = true, image: Image? = nil, color: Color = .primary, disabled: Bool = false, action: @escaping () -> Void) -> some View {
        modifier(NavigationItem(text: text, boldText: boldText, image: image, color: color, disabled: disabled, action: action))
    }
}
