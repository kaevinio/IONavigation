//
//  NavigatorView.swift
//  IONavigationExample
//
//  Created by Kevin Waltz on 10.06.22.
//

import SwiftUI
import IONavigation

struct NavigatorView: View {
    
    var body: some View {
        #if os(iOS)
        if horizontalSizeClass == .compact {
            Tabbar(items: tabbarItems, color: .blue, style: .rounded)
        } else {
            Sidebar(header: "IONavigation", color: .blue, itemGroups: sidebarItemGroups, actionIcon: Image(systemName: "plus.circle.fill"), action: add)
        }
        #else
        Sidebar(header: "IONavigation", color: .blue, selectionTextColor: .white, itemGroups: sidebarItemGroups, actionIcon: Image(systemName: "plus.circle.fill"), action: add)
        #endif
    }
    
    
    
    // MARK: - Variables
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
    @State var shouldShowNewApp = false
    
    
    
    // MARK: - Functions
    
    private func add() {
        // Example integration of an additional button in the sidebar
        return
    }
    
    
    
    // MARK: - Tabs
    
    // There are different approaches to setup the items for the sidebar and navigationbar.
    // I chose to create computed variables to have the setup code all in one place, which looks cleaner and is easier to understand.
    
    private var tabbarItems: [Item] {
        HomeTab.items
    }
    
    
    // My favorite way of dealing with the data for the items is to create enums, which I can iterate and map to create the needed items.
    
    private var sidebarItemGroups: [ItemGroup] {
        [homeGroup(), appGroup(), settingsGroup()]
    }
    
    private func homeGroup() -> ItemGroup {
        ItemGroup(id: "home", items: HomeTab.items)
    }
    
    private func appGroup() -> ItemGroup {
        ItemGroup(id: "library", header: "Library", items: LibraryTab.items)
    }
    
    private func settingsGroup() -> ItemGroup {
        ItemGroup(id: "settings", header: "Settings", items: SettingsTab.items, isCollapsable: false)
    }
    
}
