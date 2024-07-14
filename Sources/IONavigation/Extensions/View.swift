//
//  View.swift
//  
//
//  Created by Kevin Waltz on 12.02.23.
//

import SwiftUI

extension View {    
    @ViewBuilder
    public func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
    @ViewBuilder
    public func setupTabItem(_ item: Item) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .tag(item)
    }
}
