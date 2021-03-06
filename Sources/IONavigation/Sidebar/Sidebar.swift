//
//  Sidebar.swift
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct Sidebar: View {
    
    public init(header: String? = nil, color: Color, itemGroups: [ItemGroup], actionIcon: Image? = nil, action: (() -> Void)? = nil) {
        self.header = header
        self.itemGroups = itemGroups
        self.color = color
        
        self.actionIcon = actionIcon
        self.action = action
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            SidebarView(selectedId: $sidebarSelection.selectedViewID, header: header, color: color, itemGroups: itemGroups, actionIcon: actionIcon, action: action)
                .background(.regularMaterial)
                .frame(maxHeight: .infinity)
                .frame(width: Values.sidebarWidth)
                .ignoresSafeArea(.keyboard, edges: .bottom)
            
            if let view = itemGroups.flatMap { $0.items }.filter { $0.id == sidebarSelection.selectedViewID }.first?.view {
                view
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .macWindowSize()
        .onAppear {
            DispatchQueue.main.async {
                self.sidebarSelection.selectedViewID = self.itemGroups.first?.items.first?.id ?? ""
            }
        }
    }
    
    
    
    // MARK: - Variables
    
    @StateObject private var sidebarSelection = SidebarSelection.shared
    
    private let header: String?
    private let color: Color
    private var itemGroups: [ItemGroup]
    
    private let actionIcon: Image?
    private let action: (() -> Void)?
    
}
