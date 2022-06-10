//
//  SidebarHeader.swift
//
//  Created by Kevin Waltz on 09.06.22.
//

import SwiftUI

struct SidebarHeader: View {
    
    var body: some View {
        if let header = header {
            HStack(spacing: 0) {
                Text(header)
                    .font(.system(size: Values.navigationTextSize, weight: .semibold))
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: Values.navigationBarHeight)
                
                if let actionIcon = actionIcon, let action = action {
                    SidebarButton(image: actionIcon, color: color, action: action)
                }
            }
            .padding(.leading, Values.minorPadding / 2)
            #if os(iOS)
            .padding(.top, Values.minorPadding)
            #else
            .padding(.top, Values.middlePadding)
            #endif
        }
    }
    
    
    
    // MARK: - Variables
    
    let header: String?
    let color: Color
    
    let actionIcon: Image?
    let action: (() -> Void)?
    
}
