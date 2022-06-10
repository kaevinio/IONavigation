//
//  SidebarButton.swift
//
//  Created by Kevin Waltz on 02.05.22.
//

import SwiftUI

struct SidebarButton: View {
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: Values.cornerRadius)
                    .frame(width: Values.itemSize, height: Values.itemSize)
                    .foregroundColor(isHovering ? color.opacity(0.1) : .clear)
                
                image
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(color)
                    .frame(width: Values.navigationItemSize, height: Values.navigationItemSize)
            }
        }
        .buttonStyle(.plain)
        .background(.white.opacity(0.00001))
        .cornerRadius(Values.cornerRadius)
        .onHover { hovering in
            self.isHovering = hovering
        }
    }
    
    
    
    // MARK: - Variables
    
    @State private var isHovering = false
    
    let image: Image
    let color: Color
    let action: () -> Void
    
}
