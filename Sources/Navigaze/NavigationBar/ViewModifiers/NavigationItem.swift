//
//  NavigationItem.swift
//  UXlytics
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct NavigationItem: ViewModifier {
    let image: Image
    let imageColor: Color
    let action: () -> Void
    
    
    public func body(content: Content) -> some View {
        HStack(alignment: .center) {
            content
            
            Spacer()
            
            Button(action: action) {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18)
                    .foregroundColor(imageColor)
            }
            .buttonStyle(.plain)
        }
        .frame(height: Values.navigationBarHeight)
        .padding(.trailing, Values.middlePadding)
    }
}

extension View {
    public func navigationItem(image: Image, imageColor: Color, action: @escaping () -> Void) -> some View {
        modifier(NavigationItem(image: image, imageColor: imageColor, action: action))
    }
}
