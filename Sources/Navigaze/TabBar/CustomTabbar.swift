//
//  CustomTabbar.swift
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct CustomTabbar: View {
    
    public init(projectImage: Binding<Image>,
                projectTitle: Binding<String>,
                projectAction: @escaping () -> Void,
                tabItems: [TabModel],
                color: Color) {
        
        self._projectImage = projectImage
        self._projectTitle = projectTitle
        self.projectAction = projectAction
        self.tabItems = tabItems
        self.color = color
    }
    
    public var body: some View {
        TabView(projectImage: $projectImage, projectTitle: $projectTitle, projectAction: projectAction, tabs: tabItems, color: color, selectedIndex: $selectedIndex) { index in
            tabItems[index].view
        }
    }
    
    
    
    // MARK: - Variables
    
    @Binding public var projectImage: Image
    @Binding public var projectTitle: String
    public var projectAction: () -> Void
    
    public var tabItems: [TabModel]
    public let color: Color
    
    @State private var selectedIndex: Int? = 0
    
}
