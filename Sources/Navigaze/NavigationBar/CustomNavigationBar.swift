//
//  CustomNavigationBar.swift
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct CustomNavigationBar: View {
    
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
        .padding(.top, Values.minorPadding)
        #else
        .padding(.top, Values.middlePadding)
        #endif
    }
    
    
    
    // MARK: - Variables
    
    public var title: String
    
}
