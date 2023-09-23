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
            case .circular:
                Capsule()
                    .foregroundColor(backgroundColor)
            default:
                RoundedRectangle(cornerRadius: style == .rounded ? Values.cornerRadius : 0)
                    .foregroundColor(backgroundColor)
            }
            
            HStack(spacing: 6) {
                TabbarIcon(image: item.image, color: isSelected ? item.selectionTextColor : .primary)
                
                if isSelected {
                    Text(item.title)
                        .foregroundColor(isSelected ? item.selectionTextColor : .primary)
                        .font(font)
                }
            }
            .padding(.vertical, 6)
            .padding(.horizontal, Values.minorPadding)
        }
        .frame(height: Values.itemSize)
        .frame(minWidth: Values.buttonSize)
        .fixedSize()
        .onHover { self.isHovering = $0 }
        .transaction { transaction in
            guard !animateSelection else { return }
            transaction.animation = nil
        }
    }
    
    
    
    // MARK: - Variables
    
    @State private var isHovering = false
    
    let item: Item
    let font: Font
    let isSelected: Bool
    let color: Color
    let style: TabStyle
    let animateSelection: Bool
    
    
    
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
