//
//  CustomNavigationBar.swift
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
            HStack(spacing: 0) {
                Text(title)
                    .font(.system(size: Values.navigationTextSize, weight: .semibold))
                    .frame(height: Values.navigationBarHeight)
                    .lineLimit(1)
                    
                Spacer()
            }
            .padding(.leading, Values.middlePadding)
            .padding(.trailing, Values.minorPadding)
            
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
