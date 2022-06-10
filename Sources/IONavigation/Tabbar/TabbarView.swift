//
//  TabbarView.swift
//  
//
//  Created by Kevin Waltz on 09.06.22.
//

import SwiftUI

struct TabbarView: View {
    
    var body: some View {
        HStack {
            ForEach(items, id: \.id) { item in
                Button {
                    self.selectedId = item.id
                } label: {
                    TabbarItem(item: item, isSelected: selectedId == item.id, color: color)
                }
                .buttonStyle(.plain)
            }
        }
        .frame(height: Values.tabbarHeight)
        .padding(.horizontal, Values.middlePadding)
        .padding(.bottom, Values.middlePadding)
    }
    
    
    
    // MARK: - Variables
    
    @Binding var selectedId: String
    
    let items: [Item]
    let color: Color
    
}
