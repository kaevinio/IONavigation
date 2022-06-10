//
//  MacWindowSize.swift
//  
//
//  Created by Kevin Waltz on 01.05.22.
//

import SwiftUI

#if os(macOS)
public struct MacWindowSize: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .frame(minWidth: minWidth, maxWidth: .infinity, minHeight: minHeight, maxHeight: .infinity)
    }
    
    
    
    // MARK: - Varibles
    
    let minWidth: CGFloat
    let minHeight: CGFloat
    
}

extension View {
    public func macWindowSize(minWidth: CGFloat = 800, minHeight: CGFloat = 400) -> some View {
        modifier(MacWindowSize(minWidth: minWidth, minHeight: minHeight))
    }
}
#endif
