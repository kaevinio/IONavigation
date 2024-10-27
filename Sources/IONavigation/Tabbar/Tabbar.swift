//
//  Tabbar.swift
//
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct Tabbar: View {
    
    // MARK: - Properties
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
    @StateObject private var tabbarViewModel: TabbarViewModel
    
    private let barColor: Color
    private let itemColor: Color
    private let itemTintColor: Color
    
    
    
    // MARK: - Init
    
    public init(items: [Item], barColor: Color, itemColor: Color, itemTintColor: Color, font: Font? = nil, style: TabStyle, withAnimation: Bool = true) {
        self._tabbarViewModel = StateObject(wrappedValue: TabbarViewModel(items: items, font: font, style: style, withAnimation: withAnimation))
        
        self.barColor = barColor
        self.itemColor = itemColor
        self.itemTintColor = itemTintColor
    }
    
    
    
    // MARK: - Body
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $tabbarViewModel.selectedItem) {
                ForEach(tabbarViewModel.items) { item in
                    #if os(iOS)
                    if #available(iOS 18, *) {
                        item.view
                            .if(horizontalSizeClass == .regular) { tabItem in
                                tabItem.tabItem {
                                    Text(item.title)
                                }
                            }
                            .setupTabItem(item)
                    } else {
                        item.view
                            .setupTabItem(item)
                    }
                    #else
                    item.view
                        .setupTabItem(item)
                    #endif
                }
            }
            
            #if os(iOS)
            if #available(iOS 18, *) {
                if horizontalSizeClass == .compact {
                    TabbarView(barColor: barColor, itemColor: itemColor, itemTintColor: itemTintColor)
                        .environmentObject(tabbarViewModel)
                }
            } else {
                TabbarView(barColor: barColor, itemColor: itemColor, itemTintColor: itemTintColor)
                    .environmentObject(tabbarViewModel)
            }
            #endif
        }
    }
    
}
