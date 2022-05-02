//
//  CustomTabbar.swift
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct CustomTabbar: View {
    
    public init(title: String, tabGroups: [TabGroup], color: Color) {
        self.title = title
        self.tabGroups = tabGroups
        self.color = color
        
        self.selectedId = tabGroups.first?.tabs.first?.id ?? ""
    }
    
    public var body: some View {
        TabView(title: title, tabGroups: tabGroups, color: color, selectedId: $selectedId) { id in
            tabGroups.flatMap { $0.tabs }.filter { $0.id == id }.first?.view
        }
        .macWindowSize()
    }
    
    
    
    // MARK: - Variables
    
    public let title: String
    public let tabGroups: [TabGroup]
    public let color: Color
    
    @State private var selectedId: String
    
}
