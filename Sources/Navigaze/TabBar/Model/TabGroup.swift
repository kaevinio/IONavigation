//
//  TabGroup.swift
//  
//
//  Created by Kevin Waltz on 02.05.22.
//

import Foundation

public struct TabGroup {
    
    public init(id: String, header: String, tabs: [TabModel]) {
        self.id = id
        self.header = header
        self.tabs = tabs
    }
    
    let id: String
    let header: String
    let tabs: [TabModel]
    
}
