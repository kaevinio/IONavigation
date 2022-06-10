//
//  Avatar.swift
//  UXlytics
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct Avatar: ViewModifier {
    
    public func body(content: Content) -> some View {
        HStack(alignment: .bottom, spacing: 0) {
            content
            
            VStack(alignment: .center, spacing: 0) {
                Button(action: action) {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: Values.itemSize, height: Values.itemSize)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(isHovering ? color : .clear, lineWidth: 1)
                        )
                        .onHover { hovering in
                            self.isHovering = hovering
                        }
                }
                .buttonStyle(.plain)
                .frame(height: Values.navigationBarHeight)
                .padding(.trailing, Values.middlePadding)
                
                Divider()
            }
            .frame(width: Values.navigationBarHeight)
            #if os(iOS)
            .padding(.top, horizontalSizeClass == .compact ? 0 : Values.minorPadding)
            #else
            .padding(.top, Values.middlePadding)
            #endif
        }
    }
    
    
    
    // MARK: - Variables
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
    @State var isHovering = false
    
    let image: Image
    let color: Color
    let action: () -> Void
    
}

extension View {
    public func avatar(image: Image, color: Color, action: @escaping () -> Void) -> some View {
        modifier(Avatar(image: image, color: color, action: action))
    }
}
