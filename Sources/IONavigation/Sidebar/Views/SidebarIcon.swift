//
//  SidebarIcon.swift
//
//  Created by Kevin Waltz on 09.06.22.
//

import SwiftUI

struct SidebarIcon: View {
    
    var body: some View {
        image
            .resizable()
            .renderingMode(.template)
            .scaledToFit()
            .frame(width: Values.iconSize, height: Values.iconSize)
            .foregroundColor(color)
    }
    
    
    
    // MARK: - Variables
    
    let image: Image
    let color: Color
    
}
