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
            SidebarIcon(image: item.image, color: isSelected ? item.selectionTextColor : item.defaultTitleColor)
            
            Text(item.title)
                .font(font)
                .foregroundColor(isSelected ? item.selectionTextColor : item.defaultTitleColor)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if let detailView = item.detailView {
                detailView
            }
        }
        .padding(.horizontal, Values.minorPadding)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: Values.buttonSize, alignment: .leading)
        .background(.white.opacity(0.00001))
        .background(isHovering ? AnyView(item.selectionBackground.opacity(0.4)) : AnyView(Color.clear))
        .background(isSelected ? item.selectionBackground : AnyView(Color.clear))
        .cornerRadius(Values.cornerRadius)
        .onHover { hovering in
            self.isHovering = hovering
        }
    }
    
    
    
    // MARK: - Variables
    
    @State private var isHovering = false
    
    let item: Item
    let font: Font
    let isSelected: Bool
    
}
