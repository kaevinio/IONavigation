//
//  Sidebar.swift
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct Sidebar<Content: View>: View {
    
    public var body: some View {
        HStack(spacing: 0) {
            SidebarContent(selectedIndex: $selectedIndex, title: title, tabs: tabs, color: color, projectImage: $projectImage, projectTitle: $projectTitle, projectAction: projectAction)
                .padding(.horizontal, 16)
                .background(.regularMaterial)
                .frame(maxHeight: .infinity)
                .frame(width: Values.sidebarWidth)
            
            content(selectedIndex ?? 0)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    
    
    // MARK: - Variables
    
    public let title: String
    public let tabs: [TabModel]
    public let color: Color
    
    @Binding public var selectedIndex: Int?
    
    @Binding public var projectImage: Image
    @Binding public var projectTitle: String
    public var projectAction: () -> Void
    
    
    @ViewBuilder public let content: (Int) -> Content
    
}
