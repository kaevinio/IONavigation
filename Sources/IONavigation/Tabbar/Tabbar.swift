//
//  Tabbar.swift
//
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct Tabbar: View {
    
    // MARK: - Properties
    
    @State private var selectedId = ""
    
    private let items: [Item]
    private let backgroundColor: Color
    private let foregroundColor: Color
    private let font: Font?
    private let style: TabStyle
    
    
    
    // MARK: - Init
    
    public init(items: [Item], backgroundColor: Color, foregroundColor: Color, font: Font? = nil, style: TabStyle) {
        self.items = items
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.font = font
        self.style = style
    }
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedId) {
                ForEach(items) { item in
                    item.view
                        .setupTabItem(item)
                }
            }
            
            TabbarView(selectedId: $selectedId,
                       items: items,
                       backgroundColor: backgroundColor,
                       foregroundColor: foregroundColor,
                       font: font,
                       style: style)
            .onAppear {
                selectedId = items.first?.id ?? ""
            }
        }
    }
    
}
