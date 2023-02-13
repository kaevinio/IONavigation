//
//  SidebarView.swift
//
//
//  Created by Kevin Waltz on 26.04.22.
//

import SwiftUI

struct SidebarView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let header {
                SidebarHeader(header: header, color: foregroundColor, actionIcon: actionIcon, actionTooltip: actionTooltip, actionShortcut: actionShortcut, action: action)
            }
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: Values.majorPadding) {
                    ForEach(itemGroups, id: \.id) { group in
                        ItemGroupView(selectedId: $selectedId,
                                      header: group.header,
                                      items: group.items,
                                      isCollapsable: group.isCollapsable)
                    }
                }
                .padding(.bottom, Values.minorPadding)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, Values.middlePadding)
        #if os(macOS)
        .if(backgroundTranslucency) { sidebar in
            sidebar.translucentBackground()
        }
        .if(!backgroundTranslucency) { sidebar in
            sidebar.background(backgroundColor)
        }
        #else
        .background(backgroundColor)
        #endif
    }
    
    
    
    // MARK: - Variables
    
    
    @Binding public var selectedId: String
    
    let backgroundTranslucency: Bool
    let backgroundColor: Color
    let foregroundColor: Color
    let header: String?
    
    let itemGroups: [ItemGroup]
    
    let actionIcon: Image?
    let actionTooltip: String?
    let actionShortcut: KeyboardShortcut?
    let action: (() -> Void)?
    
}
