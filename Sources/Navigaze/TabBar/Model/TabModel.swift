//
//  TabModel.swift
//  UXlytics
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct TabModel {
    
    public init(id: String, title: String, image: Image, view: AnyView) {
        self.id = id
        self.title = title
        self.image = image
        self.view = view
    }
    
    let id: String
    let title: String
    let image: Image
    let view: AnyView // The view to be shown needs to be wrapped in 'AnyView' as a 'View' cannot be passed in SwiftUI
    
}
