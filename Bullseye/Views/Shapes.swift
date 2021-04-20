//
//  Shapes.swift
//  Bullseye
//
//  Created by Lucas Martins Mendes Vieira on 29/03/21.
//

import SwiftUI

struct Shapes: View {
    
    @State private var wideShape = true
    
    var body: some View {
        VStack {
            
            if !wideShape {
                Circle()
                    .strokeBorder(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, lineWidth: 20.0)
                    .frame(width: wideShape ? 200.0 : 100, height: 100.0)
                    .transition(.scale)
            }
            
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color.blue)
                .frame(width: wideShape ? 200.0 : 100, height: 100.0)
                .animation(.easeOut)
            
            Capsule()
                .fill(Color.blue)
                .frame(width: wideShape ? 200.0 : 100, height: 100.0)
            
            Ellipse()
                .fill(Color.blue)
                .frame(width: wideShape ? 200.0 : 100, height: 100.0)
            
            Button(action: {
                withAnimation {
                    wideShape.toggle()
                }
            }) {
                Text("Animate!")
            }
        }
        .background(Color.green)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
