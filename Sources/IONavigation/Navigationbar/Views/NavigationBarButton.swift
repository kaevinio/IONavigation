//
//  NavigationBarButton.swift
//  
//
//  Created by Kevin Waltz on 31.10.22.
//

import SwiftUI

struct NavigationBarButton: View {
    
    var body: some View {
        Button(action: action) {
            icon
                .font(font)
                .foregroundColor(color)
                .frame(width: Values.navigationItemSize, height: Values.navigationItemSize)
                .padding(Values.middlePadding / 2)
                .background(isHovering ? color.opacity(0.1) : .clear)
                .cornerRadius(Values.cornerRadius)
        }
        .buttonStyle(.plain)
        .frame(height: Values.navigationBarHeight)
        .padding(.leading, Values.minorPadding)
        .frame(width: Values.navigationBarHeight)
        .onHover { hovering in
            self.isHovering = hovering
        }
    }
    
    
    
    // MARK: - Variables
    
    @State private var isHovering = false
    
    let icon: Image
    let font: Font
    let color: Color
    let action: () -> Void
    
}
