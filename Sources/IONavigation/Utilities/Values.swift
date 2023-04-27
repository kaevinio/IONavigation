//
//  Values.swift
//  
//
//  Created by Kevin Waltz on 24.04.22.
//

import SwiftUI

struct Values {
    
    #if os(macOS)
    static let minorPadding: CGFloat = 12
    static let middlePadding: CGFloat = 16
    static let majorPadding: CGFloat = 24
    
    static let cornerRadius: CGFloat = 8
    
    static let sidebarWidth: CGFloat = 250
    
    static let navigationBarHeight: CGFloat = 44
    static let navigationBarItemWidth: CGFloat = 30
    static let navigationItemSize: CGFloat = 16
    static let navigationTextSize: CGFloat = 18
    
    static let itemSize: CGFloat = 30
    static let iconSize: CGFloat = 16
    static let buttonSize: CGFloat = 30
    
    static let lineSize: CGFloat = 0.75
    #else
    static let minorPadding: CGFloat = 16
    static let middlePadding: CGFloat = 24
    static let majorPadding: CGFloat = 36
    
    static let cornerRadius: CGFloat = 8
    
    static let sidebarWidth: CGFloat = 250
    
    static let compactNavigationBarHeight: CGFloat = 44
    static let navigationBarHeight: CGFloat = 60
    static let navigationBarItemWidth: CGFloat = 36
    static let navigationItemSize: CGFloat = 20
    static let navigationTextSize: CGFloat = 24
    
    static let itemSize: CGFloat = 36
    static let iconSize: CGFloat = 20
    static let buttonSize: CGFloat = 40
    
    static let lineSize: CGFloat = 0.5
    #endif
    
}
