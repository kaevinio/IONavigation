//
//  TabbarItem.swift
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

struct TabbarItem: View {
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            
            ZStack {
                switch style {
                case .circle:
                    Circle()
                        .foregroundColor(backgroundColor)
                default:
                    RoundedRectangle(cornerRadius: style == .rounded ? Values.cornerRadius : 0)
                        .foregroundColor(backgroundColor)
                }
                
                TabbarIcon(image: item.image, color: isSelected ? .white : color)
            }
            .frame(width: Values.buttonSize, height: Values.buttonSize)
            .onHover { hovering in
                self.isHovering = hovering
            }
            
            Spacer()
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
