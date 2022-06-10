//
//  BasicView.swift
//  Shared
//
//  Created by Kevin Waltz on 10.06.22.
//

import SwiftUI

struct BasicView: View {
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Hello, world!")
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color("primaryBackground"))
    }
    
}

struct BasicView_Previews: PreviewProvider {
    static var previews: some View {
        BasicView()
    }
}
