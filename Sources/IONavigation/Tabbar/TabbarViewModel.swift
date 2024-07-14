//
//  TabbarViewModel.swift
//
//
//  Created by Kaevin on 14.07.24.
//

import SwiftUI

public class TabbarViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var items: [Item]
    @Published var selectedItem: Item
    
    @Published var barColor: Color
    @Published var itemColor: Color
    @Published var itemTintColor: Color
    @Published var font: Font?
    @Published var style: TabStyle
    
    
    
    // MARK: - Init
    
    public init(items: [Item], barColor: Color, itemColor: Color, itemTintColor: Color, font: Font? = nil, style: TabStyle) {
        self.items = items
        self.selectedItem = items.first ?? Item(id: "", title: "", image: Image(""), view: AnyView(Text("")))
        
        self.barColor = barColor
        self.itemColor = itemColor
        self.itemTintColor = itemTintColor
        self.font = font
        self.style = style
    }
    
    
    
    // MARK: - Functions
    
    public func selectItem(_ item: Item) {
        self.selectedItem = item
        
        impactFeedback(.light)
    }
    
    private func impactFeedback(_ style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: style)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
    }
    
}
