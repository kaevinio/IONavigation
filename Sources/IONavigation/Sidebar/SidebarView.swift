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
            if let header = header {
                SidebarHeader(header: header, color: color, actionIcon: actionIcon, action: action)
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
        .translucentBackground()
        #endif
    }
    
    
    
    // MARK: - Variables
    
    
    @Binding public var selectedId: String
    
    let color: Color
    let header: String?
    
    let itemGroups: [ItemGroup]
    
    let actionIcon: Image?
    let action: (() -> Void)?
    
}
