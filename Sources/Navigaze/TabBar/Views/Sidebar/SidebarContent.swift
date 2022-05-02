//
//  SidebarContent.swift
//
//  Created by Kevin Waltz on 26.04.22.
//

import SwiftUI

public struct SidebarContent: View {
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                Text(title)
                    .font(.system(size: 18, weight: .semibold))
                    .frame(height: Values.navigationBarHeight)
                    .foregroundColor(.primary)
                
                Spacer()
                
                ZStack(alignment: .center) {
                    Capsule()
                        .foregroundColor(color)
                    
                    Text("Beta")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.white)
                }
                .frame(width: 60, height: 20)
            }
            .padding(.horizontal, Values.middlePadding / 2)
            #if os(iOS)
            .padding(.top, Values.minorPadding)
            #else
            .padding(.top, Values.middlePadding)
            #endif
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: Values.majorPadding) {
                    ForEach(tabGroups, id: \.id) { group in
                        VStack(alignment: .leading, spacing: Values.minorPadding / 2) {
                            Text(group.header)
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.gray)
                                .padding(.leading, Values.middlePadding / 2)
                            
                            VStack(spacing: Values.middlePadding / 3) {
                                ForEach(group.tabs, id: \.id) { tab in
                                    Button {
                                        self.selectedId = tab.id
                                    } label: {
                                        TabItem(item: tab, isSelected: selectedId == tab.id, color: color)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                        }
                    }
                }
                .padding(.top, Values.minorPadding)
                .padding(.bottom, Values.majorPadding)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, Values.middlePadding)
    }
    
    
    
    // MARK: - Variables
    
    @Binding public var selectedId: String
    
    public let title: String
    public let tabGroups: [TabGroup]
    public let color: Color
    
}
