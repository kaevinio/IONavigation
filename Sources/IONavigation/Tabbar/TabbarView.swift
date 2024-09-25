//
//  TabbarView.swift
//  
//
//  Created by Kevin Waltz on 09.06.22.
//

import SwiftUI

struct TabbarView: View {
    
    // MARK: - Properties
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif
    
    @EnvironmentObject private var tabbarViewModel: TabbarViewModel
    
    let barColor: Color
    let itemColor: Color
    let itemTintColor: Color
    
    private var spacing: CGFloat {
        #if os(iOS)
        horizontalSizeClass == .compact ? Values.minorPadding / 2 : Values.majorPadding
        #else
        Values.majorPadding
        #endif
    }
    
    
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: Values.middlePadding / 2) {
            Divider()
                .frame(height: 1)
                #if os(iOS)
                .opacity(horizontalSizeClass == .compact ? 0 : 1)
                #endif
            
            HStack(spacing: spacing) {
                ForEach(tabbarViewModel.items) { item in
                    Button {
                        tabbarViewModel.selectItem(item)
                    } label: {
                        TabbarItem(item: item, itemColor: itemColor, itemTintColor: itemTintColor)
                    }
                    .buttonStyle(.plain)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, Values.minorPadding)
        }
        .background(barColor)
    }
    
}
