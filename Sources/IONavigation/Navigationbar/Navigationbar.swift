//
//  NavigationBar.swift
//
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct Navigationbar: View {
    
    public init(titleItem: AnyView? = nil, title: String? = nil, font: Font? = nil) {
        self.titleItem = titleItem
        self.title = title
        self.font = font
    }
    
    public var body: some View {
        Group {
            if let title {
                Text(title)
            } else if let titleItem {
                titleItem
            } else {
                Text("")
            }
        }
        .font(font ?? .system(size: Values.navigationTextSize, weight: .semibold))
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: Values.navigationBarHeight)
        .lineLimit(1)
        .padding(.leading, Values.middlePadding)
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
    
    private var title: String?
    private var titleItem: AnyView?
    private var font: Font?
    
}
