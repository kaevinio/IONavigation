//
//  SidebarHeader.swift
//
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
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: Values.navigationBarHeight)
                
                
                if let actionIcon, let action {
                    if #available(macOS 12.3, *) {
                        SidebarButton(image: actionIcon, color: color, tooltip: actionTooltip, action: action)
                            .keyboardShortcut(actionShortcut)
                    } else {
                        SidebarButton(image: actionIcon, color: color, tooltip: actionTooltip, action: action)
                    }
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
    let actionTooltip: String?
    let actionShortcut: KeyboardShortcut?
    let action: (() -> Void)?
    
}
