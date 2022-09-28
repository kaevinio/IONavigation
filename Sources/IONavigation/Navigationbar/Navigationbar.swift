//
//  NavigationBar.swift
//
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct Navigationbar: View {
    
    public init(title: String) {
        self.title = title
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            Text(title)
                .font(.system(size: Values.navigationTextSize, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: Values.navigationBarHeight)
                .lineLimit(1)
                .padding(.leading, Values.middlePadding)
            
            Divider()
        }
        #if os(iOS)
        .padding(.top, horizontalSizeClass == .compact ? 0 : Values.minorPadding)
        #else
        .padding(.top, Values.middlePadding)
        #endif
    }
    
    
    
    // MARK: - Variables
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
    public var title: String
    
}
