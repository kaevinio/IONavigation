//
//  FullScreenView.swift
//  AppState
//
//  Created by Kevin Waltz on 14.05.22.
//

import SwiftUI

public struct FullScreenView<Content: View>: View {
    
    public init(show: Binding<Bool>,
                title: String,
                primaryBackgroundColor: Color,
                secondaryBackgroundColor: Color,
                highlightColor: Color,
                @ViewBuilder content: () -> Content) {
        
        self._show = show
        self.title = title
        self.primaryBackgroundColor = primaryBackgroundColor
        self.secondaryBackgroundColor = secondaryBackgroundColor
        self.highlightColor = highlightColor
        self.content = content()
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: 0) {
                    CustomNavigationBar(title: title)
                        .navigationItem(image: Image(systemName: "xmark"), color: highlightColor, action: dismissView)
                    
                    content
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .background(secondaryBackgroundColor)
                .cornerRadius(Values.cornerRadius)
                .padding(.vertical, geometry.size.height * 0.15)
                .padding(.horizontal, geometry.size.width * 0.15)
                .shadowBackground()
            }
            .background(primaryBackgroundColor)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
    
    
    
    // MARK: - Variables
    
    @Binding var show: Bool
    
    let title: String
    let primaryBackgroundColor: Color
    let secondaryBackgroundColor: Color
    let highlightColor: Color
    let content: Content
    
    
    
    // MARK: - Functions
    
    private func dismissView() {
        show.toggle()
    }
    
}
