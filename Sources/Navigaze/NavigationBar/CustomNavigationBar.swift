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
        HStack {
            Text(title)
                .font(.system(size: 18, weight: .semibold))
                .frame(height: Values.navigationBarHeight)
                #if os(iOS)
                .padding(.top, Values.minorPadding)
                #else
                .padding(.top, Values.middlePadding)
                #endif
            
            Spacer()
        }
        .padding(.horizontal, Values.middlePadding)
    }
    
    
    
    // MARK: - Variables
    
    public var title: String
    
}
