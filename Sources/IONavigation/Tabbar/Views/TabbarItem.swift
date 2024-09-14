//
//  TabbarItem.swift
//
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

struct TabbarItem: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var tabbarViewModel: TabbarViewModel
    
    @State private var isHovering = false
    @State private var isAnimated = false
    
    let item: Item
    let itemColor: Color
    let itemTintColor: Color
    
    
    private var isSelected: Bool {
        tabbarViewModel.selectedItem == item
    }
    
    private var backgroundColor: Color {
        if isSelected {
            return itemColor
        } else if isHovering && !isSelected {
            return itemColor.opacity(0.2)
        } else {
            return .clear
        }
    }
    
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .center) {
            switch tabbarViewModel.style {
            case .capsule:
                Capsule()
                    .foregroundStyle(backgroundColor)
            default:
                RoundedRectangle(cornerRadius: tabbarViewModel.style == .rounded ? Values.cornerRadius : 0)
                    .foregroundStyle(backgroundColor)
            }
            
            HStack(spacing: Values.minorPadding / 2) {
                TabbarIcon(item: item, color: isSelected ? itemTintColor : item.selectionTextColor, isAnimated: tabbarViewModel.withAnimation ? isAnimated : false)
                
                if isSelected {
                    Text(item.title)
                        .foregroundStyle(isSelected ? itemTintColor : item.selectionTextColor)
                }
            }
            .font(tabbarViewModel.font)
            .padding(.vertical, Values.middlePadding / 4)
            .padding(.horizontal, Values.minorPadding)
        }
        .frame(height: Values.itemSize)
        .frame(minWidth: Values.itemSize)
        .fixedSize()
        .onHover { isHovering = $0 }
        .transaction { $0.animation = nil }
        .onChange(of: tabbarViewModel.selectedItem) { newValue in
            guard item == newValue else { return }
            isAnimated.toggle()
        }
    }
    
}
