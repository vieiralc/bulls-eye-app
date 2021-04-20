//
//  TextViews.swift
//  Bullseye
//
//  Created by Lucas Martins Mendes Vieira on 29/03/21.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.body)
            .bold()
            .foregroundColor(Color("TextColor"))
    }
}

struct LabelTextView: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .kerning(1.5)
            .font(.caption)
            .bold()
            .foregroundColor(Color("TextColor"))
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
    }
}

struct ButtonText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.body)
            .fontWeight(.bold)
            .foregroundColor(Color("ModalButtonColor"))
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color.accentColor
            )
            .cornerRadius(12.0)
    }
}

struct ScoreText: View {
    var score: Int
    
    var body: some View {
        Text(String(score))
            .font(.title3)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color("TextColor"))
            .kerning(-0.2)
    }
}

struct DateText: View {
    var date: Date
    
    var body: some View {
        Text(date, style: .time)
            .font(.title3)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color("TextColor"))
            .kerning(-0.2)
    }
}

struct BigBoldText: View {
    let text: String
    
    var body: some View {
        Text(text.uppercased())
            .font(.title)
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
            .fontWeight(.black)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instructions:")
            BigNumberText(text: "666")
            SliderLabelText(text: "1")
            LabelTextView(text: "Score")
            BodyText(text: "You scored 200 points\n 🎉🎉🎉")
            ButtonText(text: "Start New Round")
            ScoreText(score: 459)
            DateText(date: Date())
            BigBoldText(text: "Leaderboard")
        }
        .padding()
    }
}
