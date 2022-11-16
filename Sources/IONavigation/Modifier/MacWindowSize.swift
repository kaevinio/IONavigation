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
            .frame(minWidth: minWidth, maxWidth: maxWidth, minHeight: minHeight, maxHeight: maxHeight)
            #endif
    }
    
    
    
    // MARK: - Varibles
    
    let minWidth: CGFloat
    let maxWidth: CGFloat
    let minHeight: CGFloat
    let maxHeight: CGFloat
    
}

extension View {
    public func macWindowSize(minWidth: CGFloat = 800, maxWidth: CGFloat = .infinity, minHeight: CGFloat = 600, maxHeight: CGFloat = .infinity) -> some View {
        modifier(MacWindowSize(minWidth: minWidth, maxWidth: maxWidth, minHeight: minHeight, maxHeight: maxHeight))
    }
}
