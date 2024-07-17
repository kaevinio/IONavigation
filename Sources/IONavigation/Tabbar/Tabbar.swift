//
//  Tabbar.swift
//
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct Tabbar: View {
    
    // MARK: - Properties
    
    @StateObject private var tabbarViewModel: TabbarViewModel
    
    private let barColor: Color
    private let itemColor: Color
    private let itemTintColor: Color
    
    
    
    // MARK: - Init
    
    public init(items: [Item], barColor: Color, itemColor: Color, itemTintColor: Color, font: Font? = nil, style: TabStyle) {
        self._tabbarViewModel = StateObject(wrappedValue: TabbarViewModel(items: items, font: font, style: style))
        
        self.barColor = barColor
        self.itemColor = itemColor
        self.itemTintColor = itemTintColor
    }
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $tabbarViewModel.selectedItem) {
                ForEach(tabbarViewModel.items) { item in
                    item.view
                        .setupTabItem(item)
                }
            }
            
            TabbarView(tabbarViewModel: tabbarViewModel, barColor: barColor, itemColor: itemColor, itemTintColor: itemTintColor)
        }
    }
    
}
