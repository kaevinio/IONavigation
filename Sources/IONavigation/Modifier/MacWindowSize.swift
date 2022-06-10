//
//  MacWindowSize.swift
//  
//
//  Created by Kevin Waltz on 01.05.22.
//

import SwiftUI


public struct MacWindowSize: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            #if os(macOS)
            .frame(minWidth: minWidth, maxWidth: .infinity, minHeight: minHeight, maxHeight: .infinity)
            #endif
    }
    
    
    
    // MARK: - Varibles
    
    let minWidth: CGFloat
    let minHeight: CGFloat
    
}

extension View {
    public func macWindowSize(minWidth: CGFloat = 800, minHeight: CGFloat = 600) -> some View {
        modifier(MacWindowSize(minWidth: minWidth, minHeight: minHeight))
    }
}
