//
//  Tabbar.swift
//
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct Tabbar: View {
    
    public init(items: [Item], backgroundColor: Color, foregroundColor: Color, style: TabStyle) {
        self.items = items
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.style = style
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            if let view = items.filter { $0.id == selectedId }.first?.view {
                view
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            TabbarView(selectedId: $selectedId, items: items, backgroundColor: backgroundColor, foregroundColor: foregroundColor, style: style)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .onAppear {
            DispatchQueue.main.async {
                self.selectedId = self.items.first?.id ?? ""
            }
        }
    }
    
    
    
    // MARK: - Variables
    
    @State private var selectedId = ""
    
    private let items: [Item]
    private let backgroundColor: Color
    private let foregroundColor: Color
    private let style: TabStyle
    
}
