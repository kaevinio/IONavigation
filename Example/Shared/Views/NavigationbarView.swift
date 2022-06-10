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
            
            ScrollView {
                Text("Hello, world!")
                    .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color("primaryBackground"))
    }
    
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationbarView()
    }
}
