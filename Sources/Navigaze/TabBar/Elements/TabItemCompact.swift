//
//  TabItemHorizontal.swift
//  UXlytics
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

struct TabItemCompact: View {
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            
            VStack {
                TabIcon(image: item.image, color: color)
            }
            .frame(width: Values.buttonSize, height: Values.buttonSize)
            .background(isSelected || isHovering ? color.opacity(0.09) : .clear)
            .cornerRadius(Values.cornerRadius)
            .onHover { hovering in
                self.isHovering = hovering
            }
            
            Spacer()
        }
    }
    
    
    
    // MARK: - Variables
    
    @State private var isHovering = false
    
    public let item: TabModel
    public let isSelected: Bool
    public let color: Color
    
}
