//
//  FullScreen.swift
//  
//
//  Created by Kevin Waltz on 15.05.22.
//

import SwiftUI

public struct FullScreen<V>: ViewModifier where V: View {
    
    public func body(content: Content) -> some View {
        ZStack {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            if show {
                FullScreenView(show: $show,
                               title: title,
                               primaryBackgroundColor: primaryBackgroundColor,
                               secondaryBackgroundColor: secondaryBackgroundColor,
                               highlightColor: highlightColor) {
                    
                    views()
                }
            }
        }
    }
    
    
    
    // MARK: - Variables
    
    @Binding var show: Bool
    
    let title: String
    let primaryBackgroundColor: Color
    let secondaryBackgroundColor: Color
    let highlightColor: Color
    let views: () -> V
    
}

extension View {
    public func fullScreen<V>(show: Binding<Bool>,
                              title: String,
                              primaryBackgroundColor: Color,
                              secondaryBackgroundColor: Color,
                              highlightColor: Color,
                              views: @escaping () -> V) -> some View where V: View {
        
        modifier(FullScreen(show: show,
                            title: title,
                            primaryBackgroundColor: primaryBackgroundColor,
                            secondaryBackgroundColor: secondaryBackgroundColor,
                            highlightColor: highlightColor,
                            views: views))
    }
}
