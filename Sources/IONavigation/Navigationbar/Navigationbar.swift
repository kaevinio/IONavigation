//
//  NavigationBar.swift
//
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct Navigationbar: View {
    
    // MARK: - Properties
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
    private var title: String?
    private var titleItem: AnyView?
    private var font: Font?
    private var color: Color
    
    
    
    // MARK: - Init
    
    public init(titleItem: AnyView? = nil, title: String? = nil, font: Font? = nil, color: Color = .primary) {
        self.titleItem = titleItem
        self.title = title
        self.font = font
        self.color = color
    }
    
    
    
    // MARK: - Body
    
    public var body: some View {
        Group {
            if let title {
                Text(title)
                    .foregroundColor(color)
                    .font(font ?? .system(size: Values.navigationTextSize, weight: .semibold))
                    .lineLimit(1)
            } else if let titleItem {
                titleItem
            } else {
                Text("")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: Values.navigationBarHeight)
        .padding(.leading, Values.middlePadding)
        #if os(iOS)
        .padding(.top, horizontalSizeClass == .compact ? 0 : Values.minorPadding)
        #else
        .padding(.top, Values.middlePadding)
        #endif
    }
    
}
