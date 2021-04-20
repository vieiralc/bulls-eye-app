//
//  Game.swift
//  Bullseye
//
//  Created by Lucas Martins Mendes Vieira on 10/02/21.
//

import Foundation

struct LeaderBoardEntry {
    let score: Int
    let date: Date
}

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderBoardEntries: [LeaderBoardEntry] = []
    let maxPoints = 100
    
    init(loadTestData: Bool = false) {
        if (loadTestData) {
            leaderBoardEntries.append(LeaderBoardEntry(score: 100, date: Date()))
            leaderBoardEntries.append(LeaderBoardEntry(score: 80, date: Date()))
            leaderBoardEntries.append(LeaderBoardEntry(score: 200, date: Date()))
            leaderBoardEntries.append(LeaderBoardEntry(score: 110, date: Date()))
            leaderBoardEntries.append(LeaderBoardEntry(score: 95, date: Date()))
        }
    }
    
    func getTarget() -> String {
        return String(target)
    }
    
    func getScore() -> String {
        return String(score)
    }
    
    func getRound() -> String {
        return String(round)
    }
    
    func points(sliderValue: Int) -> Int {
        let diff = abs(target - sliderValue)
        var bonus: Int = 0
        
        if (diff == 0) {
            bonus = 100
        } else if (diff <= 3) {
            bonus = 50
        }
        
        return self.maxPoints - diff + bonus
    }
    
    mutating func addToLeaderBoard(points: Int) {
        self.leaderBoardEntries.append(LeaderBoardEntry(score: points, date: Date()))
        self.leaderBoardEntries.sort { $0.score > $1.score }
    }
    
    mutating func startNewRound(points: Int) {
        self.score += points
        self.round += 1
        self.target = Int.random(in: 1...100)
        self.addToLeaderBoard(points: points)
    }
    
    mutating func restart() {
        self.score = 0
        self.round = 1
        self.target = Int.random(in: 1...100)
    }
    
}
