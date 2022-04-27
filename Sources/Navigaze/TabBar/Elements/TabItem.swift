//
//  TabItem.swift
//  
//
//  Created by Kevin Waltz on 24.04.22.
//

import SwiftUI

struct TabItem: View {
    
    var body: some View {
        HStack(spacing: Values.minorPadding) {
            TabIcon(image: item.image, color: color)
            
            Text(item.title)
                .font(.system(size: 16))
                .foregroundColor(.primary)
        }
        .padding(.horizontal, Values.minorPadding)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: Values.buttonSize, alignment: .leading)
        .background(isSelected || isHovering ? color.opacity(0.12) : .clear)
        .cornerRadius(Values.cornerRadius)
        .onHover { hovering in
            self.isHovering = hovering
        }
    }
    
    
    
    // MARK: - Variables
    
    @State private var isHovering = false
    
    public let item: TabModel
    public let isSelected: Bool
    public let color: Color
    
}