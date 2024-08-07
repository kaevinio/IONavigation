//
//  TabbarView.swift
//  
//
//  Created by Kevin Waltz on 09.06.22.
//

import SwiftUI

struct TabbarView: View {
    
    // MARK: - Properties
    
    @ObservedObject var tabbarViewModel: TabbarViewModel
    
    let barColor: Color
    let itemColor: Color
    let itemTintColor: Color
    
    
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: Values.middlePadding / 2) {
            Divider()
                .frame(height: 1)
                .opacity(0)
            
            HStack(spacing: Values.minorPadding) {
                ForEach(tabbarViewModel.items) { item in
                    Button {
                        tabbarViewModel.selectItem(item)
                    } label: {
                        TabbarItem(item: item,
                                   font: tabbarViewModel.font ?? .headline,
                                   isSelected: tabbarViewModel.selectedItem == item,
                                   itemColor: itemColor,
                                   itemTintColor: itemTintColor,
                                   style: tabbarViewModel.style)
                    }
                    .buttonStyle(.plain)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, Values.minorPadding)
        }
        .background(barColor)
    }
    
}
