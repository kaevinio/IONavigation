//
//  Avatar.swift
//  UXlytics
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct Avatar: ViewModifier {
    let image: Image
    let action: () -> Void
    
    
    public func body(content: Content) -> some View {
        HStack(alignment: .center) {
            content
            
            Spacer()
            
            Button(action: action) {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: Values.itemSize, height: Values.itemSize)
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)
        }
        .frame(height: Values.navigationBarHeight)
        .padding(.trailing, Values.middlePadding)
    }
}

extension View {
    public func avatar(image: Image, action: @escaping () -> Void) -> some View {
        modifier(Avatar(image: image, action: action))
    }
}
