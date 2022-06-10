//
//  NavigationbarSingleItemView.swift
//  IONavigationExample
//
//  Created by Kevin Waltz on 10.06.22.
//

import SwiftUI
import IONavigation

struct NavigationbarSingleItemView: View {
    
    var body: some View {
        VStack(spacing: 0) {
            Navigationbar(title: "Single Item")
                .navigationItem(image: Image(systemName: "star.fill"), color: .purple, action: {})
            
            ScrollView {
                Text("Hello, world!")
                    .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color("primaryBackground"))
    }
    
}

struct NavigationbarSingleItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationbarSingleItemView()
    }
}
