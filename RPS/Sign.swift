//
//  Sign.swift
//  RPS
//
//  Created by George on 06/09/2018.
//  Copyright © 2018 George Ashton. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign{
    case rock, paper, scissors
   
    var emoji: String {
    switch self {
    case .rock:
        return "👊🏼"
    case .paper:
        return "✋🏼"
    case .scissors:
        return "✌🏼"
    }
}
    
    func takeTurn(_opponent: Sign) -> GameState {
        switch self {
        case .rock:
            switch _opponent {
            case .rock:
            return GameState.draw
            case .paper:
                return GameState.lose
            case .scissors:
                return GameState.win
        }
        
        case .paper:
            switch _opponent {
            case .rock:
                return GameState.win
            case .paper:
                return GameState.draw
            case .scissors:
                return GameState.lose
            }
        case .scissors:
            switch _opponent {
            case .rock:
                return GameState.lose
            case .paper:
                return GameState.win
            case .scissors:
                return GameState.draw
            }
        }
    }
}


