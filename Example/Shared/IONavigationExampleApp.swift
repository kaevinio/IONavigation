//
//  IONavigationExampleApp.swift
//  Shared
//
//  Created by Kevin Waltz on 10.06.22.
//

import SwiftUI

@main
struct IONavigationExampleApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView()
        }
        #if os(macOS)
        .windowStyle(HiddenTitleBarWindowStyle())
        #endif
    }
    
}
