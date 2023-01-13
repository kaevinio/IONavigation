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
                backgroundColor: Color,
                foregroundColor: Color,
                header: String? = nil,
                itemGroups: [ItemGroup],
                actionIcon: Image? = nil,
                actionTooltip: String? = nil,
                actionShortcut: KeyboardShortcut? = nil,
                action: (() -> Void)? = nil) {
        
        self.minWindowWidth = minWindowWidth
        self.minWindowHeight = minWindowHeight
        
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.header = header
        self.itemGroups = itemGroups
        
        self.actionIcon = actionIcon
        self.actionTooltip = actionTooltip
        self.actionShortcut = actionShortcut
        self.action = action
        
        _showSidebar = State(initialValue: sidebarShown)
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            if showSidebar {
                SidebarView(selectedId: $sidebarSelection.selectedViewID,
                            backgroundColor: backgroundColor,
                            foregroundColor: foregroundColor,
                            header: header,
                            itemGroups: itemGroups,
                            actionIcon: actionIcon,
                            actionTooltip: actionTooltip,
                            actionShortcut: actionShortcut,
                            action: action)
                .frame(maxHeight: .infinity)
                .frame(width: Values.sidebarWidth)
                .ignoresSafeArea(.keyboard, edges: .bottom)
            }
            
            Divider()
                .ignoresSafeArea(.all)
            
            if let view = itemGroups.flatMap { $0.items }.filter { $0.id == sidebarSelection.selectedViewID }.first?.view {
                view
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.top, Values.middlePadding)
                    .ignoresSafeArea(.all)
            } else {
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.top, Values.middlePadding)
                    .ignoresSafeArea(.all)
            }
        }
        .macWindowSize(minWidth: minWindowWidth, minHeight: minWindowHeight)
        .onAppear {
            DispatchQueue.main.async {
                self.sidebarSelection.selectedViewID = self.itemGroups.first?.items.first?.id ?? ""
            }
        }
        .onChange(of: sidebarShown) { value in
            withAnimation(.easeInOut(duration: 0.2)) {
                showSidebar = value
            }
        }
    }
    
    
    
    // MARK: - Variables
    
    @AppStorage("sidebarShown") private var sidebarShown: Bool = true
    @State private var showSidebar: Bool = true
    
    @StateObject private var sidebarSelection = SidebarSelection.shared
    
    let minWindowWidth: CGFloat
    let minWindowHeight: CGFloat
    
    private let backgroundColor: Color
    private let foregroundColor: Color
    private let header: String?
    private var itemGroups: [ItemGroup]
    
    private let actionIcon: Image?
    private let actionTooltip: String?
    private let actionShortcut: KeyboardShortcut?
    private let action: (() -> Void)?
    
}
