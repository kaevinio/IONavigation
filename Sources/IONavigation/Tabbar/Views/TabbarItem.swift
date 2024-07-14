//
//  TabbarItem.swift
//
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

struct TabbarItem: View {
    
    // MARK: - Properties
    
    @State private var isHovering = false
    
    let item: Item
    let font: Font
    let isSelected: Bool
    let itemColor: Color
    let itemTintColor: Color
    let style: TabStyle
    
    
    var backgroundColor: Color {
        if isSelected {
            return itemColor
        } else if isHovering && !isSelected {
            return itemColor.opacity(0.2)
        } else {
            return .clear
        }
    }
    
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .center) {
            switch style {
            case .capsule:
                Capsule()
                    .foregroundColor(backgroundColor)
            default:
                RoundedRectangle(cornerRadius: style == .rounded ? Values.cornerRadius : 0)
                    .foregroundColor(backgroundColor)
            }
            
            HStack(spacing: 6) {
                TabbarIcon(image: item.image, color: isSelected ? itemTintColor : item.selectionTextColor)
                
                if isSelected {
                    Text(item.title)
                        .foregroundColor(isSelected ? itemTintColor : item.selectionTextColor)
                }
            }
            .font(font)
            .padding(.vertical, 6)
            .padding(.horizontal, Values.minorPadding)
        }
        .frame(height: Values.itemSize)
        .frame(minWidth: Values.buttonSize)
        .fixedSize()
        .onHover { isHovering = $0 }
    }
    
}
