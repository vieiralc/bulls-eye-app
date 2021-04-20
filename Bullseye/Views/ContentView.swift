//
//  ContentView.swift
//  Bullseye
//
//  Created by Lucas Martins Mendes Vieira on 23/11/20.
//

import SwiftUI

struct ContentView: View {
    @State private var isAlertVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            
            VStack {
                if !isAlertVisible {
                    InstructionsView(game: $game)
                        .transition(.scale)
                }
                
                if (isAlertVisible) {
                    PointsView(isAlertVisible: $isAlertVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                    
                } else {
                    HitMeButtonView(isAlertVisible: $isAlertVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                }
            }
            
            if !isAlertVisible {
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
            }
           
        }
    }
}

struct InstructionsView: View {
    @Binding var game: Game
    
    var body: some View {
        Spacer()
        VStack {
            InstructionText(text: "🎯🎯🎯\nPut the Bullseye as close as you can to")            
            BigNumberText(text: game.getTarget())
        }
        Spacer()
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
        }
            .padding()
    
    }
}

struct HitMeButtonView: View {
    @Binding var isAlertVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    func getFormattedSliderValue(value: Double) -> Int {
        let roundedValue: Int = Int(value.rounded())
        return roundedValue
    }
    
    var body: some View {
        Button(action: {
            withAnimation {
                isAlertVisible = true
            }
        }) {
            Text("Hit Me!".uppercased())
                .bold()
                .font(.title3)
        }
            .padding(20.0)
            .background(
                ZStack {
                    Color("ButtonColor")
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                }
            )
            .foregroundColor(Color.white)
            .cornerRadius(Constants.General.roundRectCornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                    .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
            )
        
        Spacer()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.light)
        
        
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
