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
                NavigationBarButton(icon: Image(systemName: "sidebar.squares.leading"), font: font, color: color, action: toggleSidebar)
                    .padding(.leading, Values.minorPadding)
                    .padding(.top, horizontalSizeClass == .compact ? 0 : Values.minorPadding)
                    .padding(.trailing, horizontalSizeClass == .compact ? -Values.minorPadding : 0)
            }
            #else
            NavigationBarButton(icon: Image(systemName: "sidebar.squares.leading"), font: font, color: color, action: toggleSidebar)
                .padding(.leading, Values.minorPadding)
                .padding(.top, Values.middlePadding)
                .help(tooltip ?? "")
            #endif
            
            content
        }
    }
    
    
    
    // MARK: - Variables
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
    let font: Font
    let color: Color
    let tooltip: String?
    
    
    
    // MARK: - Functions
    
    @AppStorage("sidebarShown") private var sidebarShown: Bool = true
    
    private func toggleSidebar() {
        sidebarShown.toggle()
    }
    
}

extension View {
    public func sidebarToggle(font: Font = .title2, color: Color = .primary, tooltip: String? = nil) -> some View {
        modifier(SidebarToggle(font: font, color: color, tooltip: tooltip))
    }
}
