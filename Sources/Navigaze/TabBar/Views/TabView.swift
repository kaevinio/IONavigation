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
            Tabbar(tabs: tabs, color: color, selectedIndex: $selectedIndex, content: content)
        } else {
            Sidebar(title: "UXlytics", tabs: tabs, color: color, selectedIndex: $selectedIndex, content: content)
        }
        #else
        Sidebar(title: "UXlytics", tabs: tabs, color: color, selectedIndex: $selectedIndex, content: content)
        #endif
    }
    
    
    
    // MARK: - Variables
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
    public let tabs: [TabModel]
    public let color: Color
    
    @Binding public var selectedIndex: Int?
    @ViewBuilder public let content: (Int) -> Content
    
}
