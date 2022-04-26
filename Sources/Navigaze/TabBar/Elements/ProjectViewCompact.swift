//
//  ProjectViewCompact.swift
//  
//
//  Created by Kevin Waltz on 24.04.22.
//

import SwiftUI

struct ProjectViewCompact: View {
    
    var body: some View {
        Button(action: action) {
            icon
                .frame(width: size, height: size)
                .cornerRadius(Values.cornerRadius)
        }
        .buttonStyle(.plain)
        .overlay(
            RoundedRectangle(cornerRadius: Values.cornerRadius)
                .stroke(isHovering ? color : .clear, lineWidth: 1)
        )
        .onHover { hovering in
            self.isHovering = hovering
        }
    }
    
    
    
    // MARK: - Variables
    
    @State var isHovering = false
    
    @Binding var icon: Image
    @Binding var title: String
    
    var size: CGFloat
    var color: Color
    var action: () -> Void
    
}
