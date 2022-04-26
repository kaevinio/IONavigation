//
//  SidebarContent.swift
//
//  Created by Kevin Waltz on 26.04.22.
//

import SwiftUI

public struct SidebarContent: View {
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.system(size: 18, weight: .semibold))
                    .frame(height: Values.navigationBarHeight)
                    .foregroundColor(.primary)
                
                Spacer()
                
                ZStack(alignment: .center) {
                    Capsule()
                        .strokeBorder(Color.gray, lineWidth: Values.lineSize)
                    
                    Text("Beta")
                        .font(.system(size: 12, weight: .semibold))
                }
                .frame(width: 60, height: 20)
            }
            .padding(.horizontal, Values.minorPadding)
            #if os(iOS)
            .padding(.top, Values.minorPadding)
            #else
            .padding(.top, Values.middlePadding)
            #endif
            
            
            ScrollView {
                ForEach(tabs, id: \.index) { tab in
                    Button {
                        self.selectedIndex = tab.index
                    } label: {
                        TabItem(item: tabs[tab.index], isSelected: selectedIndex == tab.index, color: color)
                    }
                    .buttonStyle(.plain)
                }
                .padding(.top, Values.minorPadding)
            }
            
            ProjectView(icon: $projectImage, title: $projectTitle, size: Values.itemSize, color: color, action: projectAction)
                .padding(.bottom, Values.middlePadding)
        }
        .frame(maxWidth: .infinity)
    }
    
    
    
    // MARK: - Variables
    
    @Binding public var selectedIndex: Int?
    
    public let title: String
    public let tabs: [TabModel]
    public let color: Color
    
    @Binding public var projectImage: Image
    @Binding public var projectTitle: String
    public var projectAction: () -> Void
    
}
