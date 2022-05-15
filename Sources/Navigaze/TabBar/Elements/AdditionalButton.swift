//
//  AdditionalButton.swift
//  
//
//  Created by Kevin Waltz on 02.05.22.
//

import SwiftUI

struct AdditionalButton: View {
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: Values.cornerRadius)
                    .strokeBorder(isHovering ? color : .gray, lineWidth: Values.lineSize)
                    .background(.white.opacity(0.0001))
                
                HStack {
                    icon
                        .frame(width: Values.iconSize, height: Values.iconSize)
                    
                    Text(title)
                        #if os(iOS)
                        .font(.system(size: 16, weight: .medium))
                        #else
                        .font(.system(size: 15))
                        #endif
                }
                .foregroundColor(color)
                .padding(.horizontal, Values.minorPadding)
            }
        }
        .buttonStyle(.plain)
        .onHover { hovering in
            self.isHovering = hovering
        }
    }
    
    
    
    // MARK: - Variables
    
    @State private var isHovering = false
    
    let icon: Image
    let title: String
    let color: Color
    let action: () -> Void
    
}
