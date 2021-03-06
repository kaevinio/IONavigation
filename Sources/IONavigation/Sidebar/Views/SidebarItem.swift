//
//  SidebarItem.swift
//
//  Created by Kevin Waltz on 24.04.22.
//

import SwiftUI

struct SidebarItem: View {
    
    var body: some View {
        HStack(spacing: Values.minorPadding) {
            SidebarIcon(image: item.image, color: isSelected ? .white : color)
            
            Text(item.title)
                #if os(iOS)
                .font(.system(size: 16))
                #else
                .font(.system(size: 15))
                #endif
                .foregroundColor(isSelected ? .white : .primary)
        }
        .padding(.horizontal, Values.minorPadding)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: Values.buttonSize, alignment: .leading)
        .background(.white.opacity(0.00001))
        .background(backgroundColor)
        .cornerRadius(Values.cornerRadius)
        .onHover { hovering in
            self.isHovering = hovering
        }
    }
    
    
    
    // MARK: - Variables
    
    @State private var isHovering = false
    
    public let item: Item
    public let isSelected: Bool
    public let color: Color
    
    
    
    // MARK: - Computed Properties
    
    var backgroundColor: Color {
        if isSelected {
            return color
        } else if isHovering && !isSelected {
            return color.opacity(0.2)
        } else {
            return .clear
        }
    }
    
}
