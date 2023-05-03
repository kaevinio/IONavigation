//
//  HomeTab.swift
//  IONavigationExample
//
//  Created by Kevin Waltz on 10.06.22.
//

import SwiftUI
import IONavigation

enum HomeTab: String, CaseIterable {
    case listen, discover, radio, search
    
    
    var title: String {
        switch self {
        case .listen: return "Listen"
        case .discover: return "Discover"
        case .radio: return "Radio"
        case .search: return "Search"
        }
    }
    
    var detail: String {
        switch self {
        case .listen: return "1"
        case .discover: return "2"
        case .radio: return "3"
        case .search: return "4"
        }
    }
    
    var icon: Image {
        switch self {
        case .listen: return Image(systemName: "play.circle")
        case .discover: return Image(systemName: "square.grid.2x2")
        case .radio: return Image(systemName: "dot.radiowaves.left.and.right")
        case .search: return Image(systemName: "magnifyingglass")
        }
    }
    
    var view: AnyView {
        switch self {
        case .listen: return AnyView(NavigationbarView())
        case .discover: return AnyView(NavigationbarSingleItemView())
        case .radio: return AnyView(NavigationbarMultipleItemsView())
        case .search: return AnyView(BasicView())
        }
    }
    
    
    
    // Items for navigation
    
    static var items: [Item] {
        let background = AnyView(Capsule().fill(
            LinearGradient(gradient: Gradient(colors: [.red, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing))
        )
        
        return HomeTab.allCases.map { Item(id: $0.rawValue,
                                           title: $0.title,
                                           detailView: AnyView(Text($0.detail)),
                                           image: $0.icon,
                                           selectionBackground: background,
                                           view: $0.view) }
    }
    
}
