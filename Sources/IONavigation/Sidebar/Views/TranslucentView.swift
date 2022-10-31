//
//  TranslucentView.swift
//  
//
//  Created by Kevin Waltz on 31.10.22.
//

import SwiftUI

#if os(macOS)
struct TranslucentView: NSViewRepresentable {
    var material: NSVisualEffectView.Material
    
    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.blendingMode = .behindWindow
        view.isEmphasized = true
        view.material = material
        return view
    }
    
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {}
}
#endif
