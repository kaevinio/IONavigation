//
//  ItemGroupView.swift
//
//
//  Created by Kevin Waltz on 09.06.22.
//

import SwiftUI

struct ItemGroupView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: Values.minorPadding / 2) {
            if let header = header {
                ItemGroupHeader(isCollapsed: $isCollapsed, header: header, isCollapsable: isCollapsable)
            }
            
            if !isCollapsed {
                VStack(spacing: Values.middlePadding / 3) {
                    ForEach(items, id: \.id) { item in
                        Button {
                            self.selectedId = item.id
                        } label: {
                            SidebarItem(item: item, isSelected: selectedId == item.id, color: color, defaultTextColor: defaultTextColor, selectionTextColor: selectionTextColor)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }
    
    
    
    // MARK: - Variables
    
    @Binding var selectedId: String
    
    @State var isCollapsed = false
    
    let header: String?
    let items: [Item]
    let isCollapsable: Bool
    let color: Color
    
    let defaultTextColor: Color
    let selectionTextColor: Color
    
}
