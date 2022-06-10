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
            .frame(minWidth: 800, maxWidth: .infinity, minHeight: 600, maxHeight: .infinity)
            .onAppear {
                NSWindow.allowsAutomaticWindowTabbing = false
            }
            #endif
    }
    
}

extension View {
    public func macWindowSize() -> some View {
        modifier(MacWindowSize())
    }
}
