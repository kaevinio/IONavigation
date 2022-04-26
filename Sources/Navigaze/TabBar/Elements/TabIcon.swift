//
//  TabIcon.swift
//  UXlytics
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct TabIcon: View {
    
    public var body: some View {
        image
            .resizable()
            .renderingMode(.template)
            .scaledToFit()
            .frame(width: Values.iconSize, height: Values.iconSize)
            .foregroundColor(color)
    }
    
    
    
    // MARK: - Variables
    
    public let image: Image
    public let color: Color
    
}
