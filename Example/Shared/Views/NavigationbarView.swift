//
//  NavigationbarView.swift
//  IONavigationExample
//
//  Created by Kevin Waltz on 10.06.22.
//

import SwiftUI
import IONavigation

struct NavigationbarView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            Navigationbar(title: "Navigationbar")
                .navigationItem(image: Image(systemName: "magnifyingglass"), color: .purple, action: selectSearchTab)
            
            ScrollView {
                Text("Hello, world!")
                    .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color("primaryBackground"))
    }
    
    
    
    // MARK: - Variables
    
    @StateObject private var sidebarSelection = SidebarSelection.shared
    
    
    
    // MARK: - Functions
    
    private func selectSearchTab() {
        sidebarSelection.selectedViewID = HomeTab.search.rawValue
    }
    
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationbarView()
    }
}
