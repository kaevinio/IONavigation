//
//  Item.swift
//
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct Item {
    
    public init(id: String, title: String, image: Image, view: AnyView) {
        self.id = id
        self.title = title
        self.image = image
        self.view = view
    }
    
    public let id: String
    public let title: String
    public let image: Image
    public let view: AnyView // The view to be shown needs to be wrapped in 'AnyView' as a 'View' cannot be passed in SwiftUI
    
}
