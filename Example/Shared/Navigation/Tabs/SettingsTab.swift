//
//  SettingsTab.swift
//  IONavigationExample
//
//  Created by Kevin Waltz on 10.06.22.
//

import SwiftUI
import IONavigation

enum SettingsTab: String, CaseIterable {
    case account, settings
    
    
    var title: String {
        switch self {
        case .account: return "Account"
        case .settings: return "Settings"
        }
    }
    
    var icon: Image {
        switch self {
        case .account: return Image(systemName: "person.crop.circle")
        case .settings: return Image(systemName: "gearshape")
        }
    }
    
    var view: AnyView {
        switch self {
        case .account: return AnyView(BasicView())
        case .settings: return AnyView(BasicView())
        }
    }
    
    
    
    // Items for navigation
    
    static var items: [Item] {
        SettingsTab.allCases.map { Item(id: $0.rawValue, title: $0.title, image: $0.icon, view: $0.view) }
    }
    
}
