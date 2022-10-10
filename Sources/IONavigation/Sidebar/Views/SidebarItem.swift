//
//  SidebarItem.swift
//
//
//  Created by Kevin Waltz on 24.04.22.
//

import SwiftUI

struct SidebarItem: View {
    
    var body: some View {
        HStack(spacing: Values.minorPadding) {
            SidebarIcon(image: item.image, color: isSelected ? selectionTextColor : defaultTextColor)
            
            Text(item.title)
                #if os(iOS)
                .font(.system(size: 16))
                #else
                .font(.system(size: 15))
                #endif
                .foregroundColor(isSelected ? selectionTextColor : defaultTextColor)
        }
        .padding(.horizontal, Values.minorPadding)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: Values.buttonSize, alignment: .leading)
        .background(.white.opacity(0.00001))
        .background(backgroundColor)
        .cornerRadius(Values.cornerRadius)
        .overlay(RoundedRectangle(cornerRadius: Values.cornerRadius).strokeBorder(borderColor, lineWidth: 2))
        .onHover { hovering in
            self.isHovering = hovering
        }
    }
    
    
    
    // MARK: - Variables
    
    @State private var isHovering = false
    
    let item: Item
    let isSelected: Bool
    let color: Color
    
    let defaultTextColor: Color
    let selectionTextColor: Color
    
    let selectionStyle: SelectionStyle
    
    
    
    // MARK: - Computed Properties
    
    var backgroundColor: Color {
        if selectionStyle == .border {
            return .clear
        } else if isSelected {
            return color
        } else if isHovering && !isSelected {
            return color.opacity(0.2)
        } else {
            return .clear
        }
    }
    
    var borderColor: Color {
        if selectionStyle == .fill {
            return .clear
        } else if isSelected {
            return color
        } else if isHovering && !isSelected {
            return color.opacity(0.2)
        } else {
            return .clear
        }
    }
    
}
