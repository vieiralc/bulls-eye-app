//
//  LeaderBoardView.swift
//  Bullseye
//
//  Created by Lucas Martins Mendes Vieira on 14/04/21.
//

import SwiftUI

struct LeaderBoardView: View {
    @Binding var leaderBoardIsShowing:  Bool
    @Binding var game: Game
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack(spacing: Constants.General.vstackSpacing) {
                HeaderView(leaderBoardIsShowing: $leaderBoardIsShowing)
                LabelView()
                ScrollView {
                    VStack(spacing: Constants.General.vstackSpacing) {
                        ForEach(game.leaderBoardEntries.indices) { i in
                            let leaderBoardEntry = game.leaderBoardEntries[i]
                            RowView(
                                index: i+1, score: leaderBoardEntry.score, date: leaderBoardEntry.date
                            )
                        }
                    }
                }
            }
        }
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.LeaderBoard.leaderBoardScoreColWidht)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.LeaderBoard.leaderBoardDateColWidht)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(
                    Color("LeaderBoardColor"),
                    lineWidth: Constants.General.strokeWidth
                )
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.LeaderBoard.leaderBoardMaxRowWidht)
        
    }
}

struct HeaderView: View {
    @Binding var leaderBoardIsShowing:  Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ZStack {
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "Leaderboard")
                        .padding(.leading)
                    Spacer()
                } else {
                    BigBoldText(text: "Leaderboard")
                }
            }
            .padding()
            HStack {
                Spacer()
                Button(action: {
                    leaderBoardIsShowing.toggle()
                }){
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                }
                
            }
        }
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.General.roudedViewLength)
            Spacer()
            LabelTextView(text: "Score")
                .frame(width: Constants.LeaderBoard.leaderBoardScoreColWidht)
            Spacer()
            LabelTextView(text: "Date")
                .frame(width: Constants.LeaderBoard.leaderBoardDateColWidht)
            
        }
            .padding(.leading)
            .padding(.trailing)
            .frame(maxWidth: Constants.LeaderBoard.leaderBoardMaxRowWidht)
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static private var leaderBoardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestData: true))
    
    static var previews: some View {
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
            .preferredColorScheme(.light)
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.light)
        
        
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
