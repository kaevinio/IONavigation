//
//  TabView.swift
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct TabView<Content: View>: View {
    
    public var body: some View {
        #if os(iOS)
        if horizontalSizeClass == .compact {
            Tabbar(tabGroups: tabGroups, color: color, selectedId: $selectedId, content: content)
        } else {
            Sidebar(title: title, tabGroups: tabGroups, color: color, selectedId: $selectedId, content: content)
        }
        #else
        Sidebar(title: title, tabGroups: tabGroups, color: color, selectedId: $selectedId, content: content)
        #endif
    }
    
    
    
    // MARK: - Variables
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
    public let title: String
    public let tabGroups: [TabGroup]
    public let color: Color
    
    @Binding public var selectedId: String
    @ViewBuilder public let content: (String) -> Content
    
}
