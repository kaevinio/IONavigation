//
//  SidebarSelection.swift
//  
//
//  Created by Kevin Waltz on 30.06.22.
//

import Foundation

public class SidebarSelection: ObservableObject {
    
    public static let shared = SidebarSelection()
    
    
    // MARK: - Variables
    
    @Published public var selectedViewID = ""
    
}
