//
//  NavigationbarMultipleItemsView.swift
//  IONavigationExample
//
//  Created by Kevin Waltz on 10.06.22.
//

import SwiftUI
import IONavigation

struct NavigationbarMultipleItemsView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            Navigationbar(title: "Multiple Items")
                .navigationItem(image: Image(systemName: "heart.fill"), color: .blue, action: {})
                .navigationItem(image: Image(systemName: "bookmark.fill"), color: .blue, action: {})
            
            Text("Hello, world!")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color("primaryBackground"))
    }
    
}

struct NavigationbarMultipleItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationbarMultipleItemsView()
    }
}
