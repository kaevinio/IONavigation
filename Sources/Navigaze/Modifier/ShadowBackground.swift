//
//  ShadowBackground.swift
//  AppState
//
//  Created by Kevin Waltz on 13.05.22.
//

import SwiftUI

public struct ShadowBackground: ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .cornerRadius(Values.cornerRadius)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 8)
    }
    
}

extension View {
    public func shadowBackground() -> some View {
        modifier(ShadowBackground())
    }
}
