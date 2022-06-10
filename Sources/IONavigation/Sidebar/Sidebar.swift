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
            SidebarView(selectedId: $selectedId, header: header, color: color, itemGroups: itemGroups, actionIcon: actionIcon, action: action)
                .background(.regularMaterial)
                .frame(maxHeight: .infinity)
                .frame(width: Values.sidebarWidth)
                .ignoresSafeArea(.keyboard, edges: .bottom)
            
            if let view = itemGroups.flatMap { $0.items }.filter { $0.id == selectedId }.first?.view {
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
                self.selectedId = self.itemGroups.first?.items.first?.id ?? ""
            }
        }
    }
    
    
    
    // MARK: - Variables
    
    @State private var selectedId = ""
    
    private let header: String?
    private let color: Color
    private var itemGroups: [ItemGroup]
    
    private let actionIcon: Image?
    private let action: (() -> Void)?
    
}
