//
//  TabModel.swift
//  UXlytics
//
//  Created by Kevin Waltz on 22.04.22.
//

import SwiftUI

public struct TabModel {
    
    public init(index: Int, title: String, image: Image, view: AnyView) {
        self.index = index
        self.title = title
        self.image = image
        self.view = view
    }
    
    let index: Int
    let title: String
    let image: Image
    let view: AnyView // The view to be shown needs to be wrapped in 'AnyView' as a 'View' cannot be passed in SwiftUI
    
}
