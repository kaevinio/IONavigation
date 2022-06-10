//
//  BackItem.swift
//  UXlytics
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct BackItem: ViewModifier {
    
    public func body(content: Content) -> some View {
        HStack(alignment: .bottom, spacing: 0) {
            #if os(iOS)
            VStack(alignment: .center, spacing: 0) {
                Button(action: goBack) {
                    ZStack {
                        RoundedRectangle(cornerRadius: Values.cornerRadius)
                            .frame(width: Values.itemSize, height: Values.itemSize)
                            .foregroundColor(isHovering ? color.opacity(0.1) : .clear)
                        
                        Image(systemName: "chevron.left")
                            .font(.system(size: Values.navigationItemSize, weight: .bold))
                            .foregroundColor(color)
                            .scaledToFit()
                    }
                }
                .buttonStyle(.plain)
                .frame(height: Values.navigationBarHeight)
                .padding(.leading, Values.minorPadding)
                
                Divider()
                    .padding(.trailing, Values.middlePadding)
            }
            .frame(width: Values.navigationBarHeight)
            #if os(iOS)
            .padding(.top, horizontalSizeClass == .compact ? 0 : Values.minorPadding)
            #else
            .padding(.top, Values.middlePadding)
            #endif
            .onHover { hovering in
                self.isHovering = hovering
            }
            #endif
            
            content
                #if os(iOS)
                .padding(.leading, -Values.middlePadding)
                #endif
        }
    }
    
    
    
    // MARK: - Variables
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    #endif
    
    @State private var isHovering = false
    
    let color: Color
    
    
    
    // MARK: - Functions
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    private func goBack() {
        presentationMode.wrappedValue.dismiss()
    }
    
}

extension View {
    public func backItem(color: Color) -> some View {
        modifier(BackItem(color: color))
    }
}
