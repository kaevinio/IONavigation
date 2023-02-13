//
//  TabbarItem.swift
//
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

struct TabbarItem: View {
    
    var body: some View {
        ZStack(alignment: .center) {
            switch style {
            case .circle:
                Capsule()
                    .foregroundColor(backgroundColor)
            default:
                RoundedRectangle(cornerRadius: style == .rounded ? Values.cornerRadius : 0)
                    .foregroundColor(backgroundColor)
            }
            
            HStack(spacing: 6) {
                TabbarIcon(image: item.image, color: isSelected ? .white : .primary)
                
                if isSelected {
                    Text(item.title)
                        .foregroundColor(isSelected ? .white : .primary)
                        .font(.headline)
                }
            }
            .padding(.vertical, 6)
            .padding(.horizontal, Values.minorPadding)
        }
        .frame(height: Values.itemSize)
        .frame(minWidth: Values.buttonSize)
        .fixedSize()
        .onHover { hovering in
            self.isHovering = hovering
        }
    }
    
    
    
    // MARK: - Variables
    
    @State private var isHovering = false
    
    let item: Item
    let isSelected: Bool
    let color: Color
    let style: TabStyle
    
    
    
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
