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
    
    @Published var font: Font?
    @Published var style: TabStyle
    @Published var withAnimation: Bool
    
    
    
    // MARK: - Init
    
    public init(items: [Item], font: Font? = nil, style: TabStyle, withAnimation: Bool) {
        self.items = items
        self.selectedItem = items.first ?? Item(id: "", title: "", image: Image(""), view: AnyView(Text("")))
        
        self.font = font
        self.style = style
        self.withAnimation = withAnimation
    }
    
    
    
    // MARK: - Functions
    
    public func selectItem(_ item: Item) {
        self.selectedItem = item
        
        #if os(iOS)
        impactFeedback(.light)
        #endif
    }
    
    #if os(iOS)
    private func impactFeedback(_ style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: style)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
    }
    #endif
    
}
