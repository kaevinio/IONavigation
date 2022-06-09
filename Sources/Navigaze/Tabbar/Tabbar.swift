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
                ForEach(itemGroups, id: \.id) { group in
                    HStack {
                        ForEach(group.items, id: \.id) { item in
                            Button {
                                self.selectedId = item.id
                            } label: {
                                TabItem(item: item, isSelected: selectedId == item.id, color: color)
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
    
    public let itemGroups: [ItemGroup]
    public let color: Color
    
    @Binding public var selectedId: String
    
    @ViewBuilder public let content: (String) -> Content
    
}
