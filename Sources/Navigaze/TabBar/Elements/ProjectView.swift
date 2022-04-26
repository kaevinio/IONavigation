//
//  Projectiew.swift
//  UXlytics
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

struct ProjectView: View {
    
    var body: some View {
        Button(action: action) {
            HStack {
                icon
                    .frame(width: size, height: size)
                    .cornerRadius(Values.cornerRadius)
                
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.primary)
            }
            .padding(Values.middlePadding / 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(isHovering ? color.opacity(0.12) : .clear)
        .cornerRadius(Values.cornerRadius)
        .buttonStyle(.plain)
        .overlay(
            RoundedRectangle(cornerRadius: Values.cornerRadius)
                .strokeBorder(.gray, lineWidth: Values.lineSize)
        )
        .onHover { hovering in
            self.isHovering = hovering
        }
    }
    
    
    
    // MARK: - Variables
    
    @State private var isHovering = false
    
    @Binding var icon: Image
    @Binding var title: String
    
    var size: CGFloat
    var color: Color
    var action: () -> Void
    
}
