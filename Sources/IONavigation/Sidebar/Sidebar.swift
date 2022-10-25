//
//  Sidebar.swift
//
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct Sidebar: View {
    
    public init(minWindowWidth: CGFloat = 800,
                minWindowHeight: CGFloat = 600,
                header: String? = nil,
                foregroundColor: Color,
                defaultTextColor: Color = .primary,
                selectionStyle: SelectionStyle = .fill,
                selectionTextColor: Color = .primary,
                itemGroups: [ItemGroup],
                actionIcon: Image? = nil,
                action: (() -> Void)? = nil) {
        
        self.minWindowWidth = minWindowWidth
        self.minWindowHeight = minWindowHeight
        
        self.header = header
        self.itemGroups = itemGroups
        self.foregroundColor = foregroundColor
        self.defaultTextColor = defaultTextColor
        
        self.selectionStyle = selectionStyle
        self.selectionTextColor = selectionTextColor
        
        self.actionIcon = actionIcon
        self.action = action
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            SidebarView(selectedId: $sidebarSelection.selectedViewID,
                        header: header,
                        color: foregroundColor,
                        defaultTextColor: defaultTextColor,
                        selectionStyle: selectionStyle,
                        selectionTextColor: selectionTextColor,
                        itemGroups: itemGroups,
                        actionIcon: actionIcon,
                        action: action)
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
        .macWindowSize(minWidth: minWindowWidth, minHeight: minWindowHeight)
        .onAppear {
            DispatchQueue.main.async {
                self.sidebarSelection.selectedViewID = self.itemGroups.first?.items.first?.id ?? ""
            }
        }
    }
    
    
    
    // MARK: - Variables
    
    @StateObject private var sidebarSelection = SidebarSelection.shared
    
    let minWindowWidth: CGFloat
    let minWindowHeight: CGFloat
    
    private let header: String?
    private let foregroundColor: Color
    private let defaultTextColor: Color
    private let selectionStyle: SelectionStyle
    private let selectionTextColor: Color
    private var itemGroups: [ItemGroup]
    
    private let actionIcon: Image?
    private let action: (() -> Void)?
    
}
