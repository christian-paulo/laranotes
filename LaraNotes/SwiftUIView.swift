//
//  SwiftUIView.swift
//  LaraNotes
//
//  Created by Christian Paulo on 11/05/22.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State var editar: Bool = false
    @State var text: String = "Hello"
    
    
    var body: some View {
        
        VStack {
            Text(text)
            if editar {
                TextField("Editar", text: $text)
            } else {
                Text("")
            }
            Button("Editar") {
                editar = !editar
            }
            
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
