//
//  ItemGroupHeader.swift
//  
//
//  Created by Kevin Waltz on 09.06.22.
//

import SwiftUI

struct ItemGroupHeader: View {
    
    var body: some View {
        Button(action: collapseGroup) {
            HStack(spacing: 0) {
                Text(header)
                    .font(font)
                    .padding(.leading, Values.middlePadding / 2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if isCollapsable {
                    Image(systemName: "chevron.right")
                        .frame(width: Values.navigationItemSize, height: Values.navigationItemSize)
                        .rotationEffect(Angle.degrees(isCollapsed ? 0 : 90))
                }
            }
            .font(.system(size: 13, weight: .medium))
            .foregroundColor(.gray)
            .background(.white.opacity(0.00001))
        }
        .buttonStyle(.plain)
    }
    
    
    
    // MARK: - Variables
    
    @Binding var isCollapsed: Bool
    
    let header: String
    let font: Font
    let isCollapsable: Bool
    
    
    
    // MARK: - Functions
    
    private func collapseGroup() {
        if !isCollapsable { return }
        
        withAnimation {
            isCollapsed.toggle()
        }
    }
    
}
