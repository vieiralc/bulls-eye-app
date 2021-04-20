//
//  PointsView.swift
//  Bullseye
//
//  Created by Lucas Martins Mendes Vieira on 12/04/21.
//

import SwiftUI

struct PointsView: View {
    
    @Binding var isAlertVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        
        
        VStack (spacing: Constants.General.vstackSpacing) {
            InstructionText(text: "The slider value is")
            BigNumberText(text: String(roundedValue))
            BodyText(text: "You scored \(points) points\n 🎉🎉🎉")
            
            Button(action: {
                withAnimation {
                    isAlertVisible = false
                }
                game.startNewRound(points: points)
            }) {
                ButtonText(text: "Start New Round")
            }
        }
            .padding()
            .frame(maxWidth: 300)
            .background(Color("BackgroundColor"))
            .cornerRadius(Constants.General.roundRectCornerRadius)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 5, y: 5)
            .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        
        PointsView(isAlertVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.light)
        
        PointsView(isAlertVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.light)
        
        
        PointsView(isAlertVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        
        PointsView(isAlertVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
