//
//  NavigationItem.swift
//  UXlytics
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct NavigationItem: ViewModifier {
    
    public func body(content: Content) -> some View {
        HStack(alignment: .bottom, spacing: 0) {
            content
            
            VStack(alignment: .center, spacing: 0) {
                Button(action: action) {
                    ZStack {
                        RoundedRectangle(cornerRadius: Values.cornerRadius)
                            .frame(width: Values.itemSize, height: Values.itemSize)
                            .foregroundColor(isHovering ? color.opacity(0.1) : color.opacity(0))
                        
                        image
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(color)
                            .frame(width: Values.navigationItemSize, height: Values.navigationItemSize)
                    }
                }
                .buttonStyle(.plain)
                .frame(height: Values.navigationBarHeight)
                .padding(.trailing, Values.middlePadding)
                
                Divider()
            }
            .frame(width: Values.navigationBarHeight)
            #if os(iOS)
            .padding(.top, Values.minorPadding)
            #else
            .padding(.top, Values.middlePadding)
            #endif
            .onHover { hovering in
                self.isHovering = hovering
            }
        }
    }
    
    
    
    // MARK: - Variables
    
    @State private var isHovering = false
    
    let image: Image
    let color: Color
    let action: () -> Void
    
}

extension View {
    public func navigationItem(image: Image, color: Color, action: @escaping () -> Void) -> some View {
        modifier(NavigationItem(image: image, color: color, action: action))
    }
}
