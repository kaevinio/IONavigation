//
//  Tabbar.swift
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct Tabbar<Content: View>: View {
    
    public var body: some View {
        VStack(spacing: 0) {
            content(selectedId)
            
            Divider()
            
            HStack {
                ForEach(tabGroups, id: \.id) { group in
                    HStack {
                        ForEach(group.tabs, id: \.id) { tab in
                            Button {
                                self.selectedId = tab.id
                            } label: {
                                TabItemCompact(item: tab, isSelected: selectedId == tab.id, color: color)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
            .frame(height: Values.tabbarHeight)
            .padding(.horizontal, Values.middlePadding)
            .padding(.bottom, Values.middlePadding)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
    
    
    // MARK: - Variables
    
    public let tabGroups: [TabGroup]
    public let color: Color
    
    @Binding public var selectedId: String
    
    @ViewBuilder public let content: (String) -> Content
    
}
