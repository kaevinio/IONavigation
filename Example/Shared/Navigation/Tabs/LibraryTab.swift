//
//  LibraryTab.swift
//  IONavigationExample
//
//  Created by Kevin Waltz on 10.06.22.
//

import SwiftUI
import IONavigation

enum LibraryTab: String, CaseIterable {
    case recently, albums, titles
    
    
    var title: String {
        switch self {
        case .recently: return "Recently Added"
        case .albums: return "Albums"
        case .titles: return "Titles"
        }
    }
    
    var icon: Image {
        switch self {
        case .recently: return Image(systemName: "clock")
        case .albums: return Image(systemName: "square.stack")
        case .titles: return Image(systemName: "music.note")
        }
    }
    
    var view: AnyView {
        switch self {
        case .recently: return AnyView(BasicView())
        case .albums: return AnyView(BasicView())
        case .titles: return AnyView(BasicView())
        }
    }
    
    
    
    // Items for navigation
    
    static var items: [Item] {
        let background = AnyView(Capsule().strokeBorder(
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing),
            lineWidth: 2)
        )
        
        return LibraryTab.allCases.map { Item(id: $0.rawValue, title: $0.title, image: $0.icon, selectionBackground: background, view: $0.view) }
    }
    
}
