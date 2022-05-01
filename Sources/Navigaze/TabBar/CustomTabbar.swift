//
//  CustomTabbar.swift
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct CustomTabbar: View {
    
    public init(tabItems: [TabModel], color: Color) {
        self.tabItems = tabItems
        self.color = color
    }
    
    public var body: some View {
        TabView(tabs: tabItems, color: color, selectedIndex: $selectedIndex) { index in
            tabItems[index].view
        }
        .macWindowSize()
    }
    
    
    
    // MARK: - Variables
    
    public var tabItems: [TabModel]
    public let color: Color
    
    @State private var selectedIndex: Int? = 0
    
}
