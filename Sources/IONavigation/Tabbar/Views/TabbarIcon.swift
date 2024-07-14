//
//  TabbarIcon.swift
//
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

struct TabbarIcon: View {
    
    // MARK: - Properties
    
    let image: Image
    let color: Color
    
    
    
    // MARK: - Body
    
    var body: some View {
        image
            .resizable()
            .renderingMode(.template)
            .scaledToFit()
            .frame(width: Values.iconSize, height: Values.iconSize)
            .foregroundColor(color)
    }
    
}
