//
//  Tabbar.swift
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct Tabbar<Content: View>: View {
    
    public var body: some View {
        ZStack {
            content(selectedIndex ?? 0)
            
            VStack(spacing: 0) {
                Spacer()
                
                Divider()
                
                HStack {
                    ForEach(tabs, id: \.index) { tab in
                        Button {
                            self.selectedIndex = tab.index
                        } label: {
                            TabItemCompact(item: tabs[tab.index], isSelected: selectedIndex == tab.index, color: color)
                        }
                    }
                    
                    ProjectViewCompact(icon: $projectImage, title: $projectTitle, size: Values.itemSize, color: color, action: projectAction)
                        .padding(.leading, Values.majorPadding)
                        .padding(.trailing, Values.middlePadding)
                }
                .frame(height: Values.tabbarHeight)
                .padding(.horizontal, Values.middlePadding)
            }
            .padding(.bottom, Values.minorPadding)
        }
        .ignoresSafeArea()
    }
    
    
    
    // MARK: - Variables
    
    public let tabs: [TabModel]
    public let color: Color
    
    @Binding public var selectedIndex: Int?
    
    @Binding public var projectImage: Image
    @Binding public var projectTitle: String
    public var projectAction: () -> Void
    
    @ViewBuilder public let content: (Int) -> Content
    
}
