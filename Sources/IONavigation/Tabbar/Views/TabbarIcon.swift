//
//  TabbarIcon.swift
//
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

struct TabbarIcon: View {
    
    // MARK: - Properties
    
    let item: Item
    let color: Color
    let isAnimated: Bool
    
    
    
    // MARK: - Body
    
    var body: some View {
        Group {
            if #available(iOS 17.0, *) {
                item.image
                    .resizable()
                    .renderingMode(.template)
                    #if os(iOS)
                    .symbolEffect(.bounce, value: isAnimated)
                    #endif
            } else {
                item.image
                    .resizable()
                    .renderingMode(.template)
            }
        }
        .scaledToFit()
        .frame(width: Values.iconSize, height: Values.iconSize)
        .foregroundColor(color)
    }
    
}
