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
            .frame(height: Values.buttonSize)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .padding(.horizontal, Values.minorPadding)
            .background(isHovering ? color.opacity(0.7) : color)
            .cornerRadius(Values.cornerRadius)
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
