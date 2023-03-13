//
//  ItemGroup.swift
//  
//
//  Created by Kevin Waltz on 02.05.22.
//

import Foundation

public struct ItemGroup: Identifiable {
    
    public init(id: String, header: String? = nil, items: [Item], isCollapsable: Bool = true) {
        self.id = id
        self.header = header
        self.items = items
        self.isCollapsable = isCollapsable
    }
    
    public let id: String
    public let header: String?
    public let items: [Item]
    public let isCollapsable: Bool
    
}
