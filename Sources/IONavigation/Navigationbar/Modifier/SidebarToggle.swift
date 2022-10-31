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
            #if os(iOS)
            if horizontalSizeClass == .regular {
                NavigationBarButton(icon: Image(systemName: "sidebar.squares.leading"), color: color, action: toggleSidebar)
                    .padding(.top, horizontalSizeClass == .compact ? 0 : Values.minorPadding)
            }
            #else
            NavigationBarButton(icon: Image(systemName: "sidebar.squares.leading"), color: color, action: toggleSidebar)
                .padding(.top, Values.middlePadding)
            #endif
            
            content
        }
    }
    
    
    
    // MARK: - Variables
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
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
