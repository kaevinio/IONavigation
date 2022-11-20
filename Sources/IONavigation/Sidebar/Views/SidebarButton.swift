//
//  SidebarButton.swift
//
//
//  Created by Kevin Waltz on 02.05.22.
//

import SwiftUI

struct SidebarButton: View {
    
    var body: some View {
        Button(action: action) {
            image
                .resizable()
                .scaledToFit()
                .foregroundColor(.primary)
                .frame(width: Values.navigationItemSize, height: Values.navigationItemSize)
                .padding(Values.middlePadding / 2)
                .background(isHovering ? color.opacity(0.1) : .clear)
                .cornerRadius(Values.cornerRadius)
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
