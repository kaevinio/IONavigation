//
//  TabbarView.swift
//  
//
//  Created by Kevin Waltz on 09.06.22.
//

import SwiftUI

struct TabbarView: View {
    
    // MARK: - Properties
    
    @Binding var selectedId: String
    
    let items: [Item]
    let backgroundColor: Color
    let foregroundColor: Color
    let font: Font?
    let style: TabStyle
    
    
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: Values.middlePadding / 2) {
            Divider()
                .frame(height: 1)
                .opacity(0)
            
            HStack(spacing: Values.minorPadding) {
                ForEach(items) { item in
                    Button {
                        selectedId = item.id
                    } label: {
                        TabbarItem(item: item,
                                   font: font ?? .headline,
                                   isSelected: selectedId == item.id,
                                   color: foregroundColor,
                                   style: style)
                    }
                    .buttonStyle(.plain)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, Values.minorPadding)
        }
        .background(backgroundColor)
    }
    
}
