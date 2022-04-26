//
//  BackItem.swift
//  UXlytics
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct BackItem: ViewModifier {
    
    public func body(content: Content) -> some View {
        HStack(alignment: .center) {
            Button(action: goBack) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(color)
                    .scaledToFit()
            }
            
            content
                .padding(.leading, 8)
            
            Spacer()
        }
    }
    
    
    
    // MARK: - Variables
    
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
