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
            ZStack {
                RoundedRectangle(cornerRadius: Values.cornerRadius)
                    .frame(width: Values.itemSize, height: Values.itemSize)
                    .foregroundColor(isHovering ? color.opacity(0.1) : .clear)
                
                icon
                    .font(.system(size: Values.navigationItemSize, weight: .bold))
                    .foregroundColor(color)
                    .scaledToFit()
            }
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
    let color: Color
    let action: () -> Void
    
}
