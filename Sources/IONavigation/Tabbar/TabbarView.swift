//
//  TabbarView.swift
//  
//
//  Created by Kevin Waltz on 09.06.22.
//

import SwiftUI

struct TabbarView: View {
    
    var body: some View {
        VStack(spacing: Values.middlePadding / 2) {
            Divider()
                .frame(height: 1)
                .overlay(.gray.opacity(0.1))
            
            HStack(spacing: 0) {
                ForEach(items, id: \.id) { item in
                    Button {
                        self.selectedId = item.id
                    } label: {
                        TabbarItem(item: item, isSelected: selectedId == item.id, color: foregroundColor, style: style)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, Values.middlePadding)
        }
        #if os(iOS)
        .padding(.bottom, Values.middlePadding / 2 + safeAreaInsets.bottom)
        #endif
        .background(backgroundColor)
    }
    
    
    
    // MARK: - Variables
    
    #if os(iOS)
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    #endif
    
    @Binding var selectedId: String
    
    let items: [Item]
    let backgroundColor: Color
    let foregroundColor: Color
    let style: TabStyle
    
}
