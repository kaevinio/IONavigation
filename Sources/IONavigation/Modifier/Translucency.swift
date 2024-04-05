//
//  Translucency.swift
//  
//
//  Created by Kevin Waltz on 01.11.22.
//

import SwiftUI

public struct Translucency: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            #if os(macOS)
            .background(TranslucentView(material: .sidebar))
            .ignoresSafeArea(.all)
            #endif
    }
    
}

extension View {
    /**
     Sets the background to a translucent state to partially show the background.
     
     INFO: This will only apply on macOS.
     */
    public func translucentBackground() -> some View {
        modifier(Translucency())
    }
}
