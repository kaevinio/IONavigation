//
//  ItemGroup.swift
//  
//
//  Created by Kevin Waltz on 02.05.22.
//

import Foundation

public struct ItemGroup {
    
    public init(id: String, header: String? = nil, items: [Item], isCollapsable: Bool = true) {
        self.id = id
        self.header = header
        self.items = items
        self.isCollapsable = isCollapsable
    }
    
    let id: String
    let header: String?
    let items: [Item]
    let isCollapsable: Bool
    
}
