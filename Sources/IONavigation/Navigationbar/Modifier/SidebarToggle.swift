//
//  SidebarToggle.swift
//  
//
//  Created by Kevin Waltz on 31.10.22.
//

import SwiftUI

public struct SidebarToggle: ViewModifier {
    
    public func body(content: Content) -> some View {
        HStack(alignment: .bottom, spacing: 0) {
            Button(action: toggleSidebar) {
                ZStack {
                    RoundedRectangle(cornerRadius: Values.cornerRadius)
                        .frame(width: Values.itemSize, height: Values.itemSize)
                        .foregroundColor(isHovering ? color.opacity(0.1) : .clear)
                    
                    Image(systemName: "sidebar.squares.leading")
                        .font(.system(size: Values.navigationItemSize, weight: .bold))
                        .foregroundColor(color)
                        .scaledToFit()
                }
            }
            .buttonStyle(.plain)
            .frame(height: Values.navigationBarHeight)
            .padding(.leading, Values.minorPadding)
            .frame(width: Values.navigationBarHeight)
            #if os(iOS)
            .padding(.top, horizontalSizeClass == .compact ? 0 : Values.minorPadding)
            .padding(.trailing, horizontalSizeClass == .compact ? 0 : Values.middlePadding)
            #else
            .padding(.top, Values.middlePadding)
            #endif
            .onHover { hovering in
                self.isHovering = hovering
            }
            
            content
                #if os(iOS)
                .padding(.leading, -Values.middlePadding)
                #endif
        }
    }
    
    
    
    // MARK: - Variables
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
    @State private var isHovering = false
    
    let color: Color
    
    
    
    // MARK: - Functions
    
    @AppStorage("sidebarShown") private var sidebarShown: Bool = true
    
    private func toggleSidebar() {
        sidebarShown.toggle()
    }
    
}

extension View {
    public func sidebarToggle(color: Color) -> some View {
        modifier(SidebarToggle(color: color))
    }
}
