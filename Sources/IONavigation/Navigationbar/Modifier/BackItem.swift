//
//  BackItem.swift
//  
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct BackItem: ViewModifier {
    
    public func body(content: Content) -> some View {
        HStack(alignment: .bottom, spacing: 0) {
            NavigationBarButton(icon: Image(systemName: "chevron.left"), color: color, action: goBack)
                #if os(iOS)
                .padding(.top, horizontalSizeClass == .compact ? 0 : Values.minorPadding)
                .padding(.trailing, horizontalSizeClass == .compact ? -Values.minorPadding : 0)
                #else
                .padding(.top, Values.middlePadding)
                #endif
                .help(tooltip ?? "")
            
            content
        }
    }
    
    
    
    // MARK: - Variables
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
    @State private var isHovering = false
    
    let color: Color
    let tooltip: String?
    
    
    
    // MARK: - Functions
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    private func goBack() {
        presentationMode.wrappedValue.dismiss()
    }
    
}

extension View {
    public func backItem(color: Color = .primary, tooltip: String? = nil) -> some View {
        modifier(BackItem(color: color, tooltip: tooltip))
    }
}
