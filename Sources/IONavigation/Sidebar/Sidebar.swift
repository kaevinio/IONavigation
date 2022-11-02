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
                color: Color,
                header: String? = nil,
                itemGroups: [ItemGroup],
                actionIcon: Image? = nil,
                action: (() -> Void)? = nil) {
        
        self.minWindowWidth = minWindowWidth
        self.minWindowHeight = minWindowHeight
        
        self.color = color
        self.header = header
        self.itemGroups = itemGroups
        
        self.actionIcon = actionIcon
        self.action = action
        
        _showSidebar = State(initialValue: sidebarShown)
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            if showSidebar {
                SidebarView(selectedId: $sidebarSelection.selectedViewID,
                            color: color,
                            header: header,
                            itemGroups: itemGroups,
                            actionIcon: actionIcon,
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
    
    private let color: Color
    private let header: String?
    private var itemGroups: [ItemGroup]
    
    private let actionIcon: Image?
    private let action: (() -> Void)?
    
}
