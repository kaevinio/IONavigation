//
//  Sidebar.swift
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct Sidebar<Content: View>: View {
    
    public var body: some View {
        HStack(spacing: 0) {
            SidebarContent(selectedId: $selectedId, title: title, tabGroups: tabGroups, color: color)
                .background(.regularMaterial)
                .frame(maxHeight: .infinity)
                .frame(width: Values.sidebarWidth)
            
            content(selectedId)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    
    
    // MARK: - Variables
    
    public let title: String
    public let tabGroups: [TabGroup]
    public let color: Color
    
    @Binding public var selectedId: String
    
    @ViewBuilder public let content: (String) -> Content
    
}
