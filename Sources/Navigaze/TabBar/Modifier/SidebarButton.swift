//
//  SidebarButton.swift
//  
//
//  Created by Kevin Waltz on 02.05.22.
//

import SwiftUI

public struct SidebarButton: ViewModifier {
    
    public func body(content: Content) -> some View {
        #if os(macOS)
        ZStack(alignment: .bottomLeading) {
            content
            
            AdditionalButton(icon: icon, title: title, color: color, action: action)
                .frame(width: Values.sidebarWidth - Values.middlePadding * 2, height: Values.buttonSize)
                .padding(.horizontal, Values.middlePadding)
                .padding(.bottom, Values.middlePadding)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        #else
        ZStack(alignment: .bottomLeading) {
            content
            
            if horizontalSizeClass == .regular {
                AdditionalButton(icon: icon, title: title, color: color, action: action)
                    .frame(width: Values.sidebarWidth - Values.middlePadding * 2, height: Values.buttonSize)
                    .padding(.horizontal, Values.middlePadding)
                    .padding(.bottom, Values.middlePadding)
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        #endif
    }
    
    
    
    // MARK: - Variables
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
    @State private var isHovering = false
    
    let icon: Image
    let title: String
    let color: Color
    let action: () -> Void
    
}

extension View {
    public func sidebarButton(icon: Image, title: String, color: Color, action: @escaping () -> Void) -> some View {
        modifier(SidebarButton(icon: icon, title: title, color: color, action: action))
    }
}
