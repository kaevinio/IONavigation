//
//  CustomPadding.swift
//  UXlytics
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct CustomPadding: ViewModifier {
    let top: CGFloat
    let bottom: CGFloat
    let horizontal: CGFloat
    
    
    public func body(content: Content) -> some View {
        content
            .padding(.top, top)
            .padding(.bottom, bottom)
            .padding(.horizontal, horizontal)
    }
}

extension View {
    public func customPadding(top: CGFloat = 24, bottom: CGFloat = 4, horizontal: CGFloat = 32) -> some View {
        modifier(CustomPadding(top: top, bottom: bottom, horizontal: horizontal))
    }
}
