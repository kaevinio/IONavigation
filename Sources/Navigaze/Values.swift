//
//  Values.swift
//  UXlytics (iOS)
//
//  Created by Kevin Waltz on 24.04.22.
//

import SwiftUI

struct Values {
    
    #if os(macOS)
    static let minorPadding: CGFloat = 12
    static let middlePadding: CGFloat = 16
    static let majorPadding: CGFloat = 24
    
    static let cornerRadius: CGFloat = 6
    
    static let sidebarWidth: CGFloat = 230
    static let tabbarHeight: CGFloat = 60
    static let navigationBarHeight: CGFloat = 30
    
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
    static let tabbarHeight: CGFloat = 72
    static let navigationBarHeight: CGFloat = 60
    
    static let itemSize: CGFloat = 36
    static let iconSize: CGFloat = 20
    static let buttonSize: CGFloat = 40
    
    static let lineSize: CGFloat = 0.5
    #endif
    
}
