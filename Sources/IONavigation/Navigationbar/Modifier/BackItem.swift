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
            #if os(iOS)
            NavigationBarButton(icon: Image(systemName: "chevron.left"), color: color, action: goBack)
                #if os(iOS)
                .padding(.top, horizontalSizeClass == .compact ? 0 : Values.minorPadding)
                .padding(.trailing, horizontalSizeClass == .compact ? -Values.minorPadding : 0)
                #else
                .padding(.top, Values.middlePadding)
                #endif
            #endif
            
            content
        }
    }
    
    
    
    // MARK: - Variables
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
    @State private var isHovering = false
    
    let color: Color
    
    
    
    // MARK: - Functions
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    private func goBack() {
        presentationMode.wrappedValue.dismiss()
    }
    
}

extension View {
    public func backItem(color: Color = .primary) -> some View {
        modifier(BackItem(color: color))
    }
}
