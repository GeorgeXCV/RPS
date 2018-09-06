//
//  ViewController.swift
//  RPS
//
//  Created by George on 06/09/2018.
//  Copyright © 2018 George Ashton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgain: UIButton!
    
    // Actions
    @IBAction func rockTapped(_ sender: Any) {
        play(Sign.rock)
    }
    
    @IBAction func paperTapped(_ sender: Any) {
        play(Sign.paper)
    }
    
    @IBAction func scissorsTapped(_ sender: Any) {
        play(Sign.scissors)
    }
    @IBAction func playAgainTapped(_ sender: UIButton) {
         resetGame()
    }
    
    // Functions
    func resetGame() {
        appSign.text = "🤖"
        gameStatus.text = "Rock,Paper,Scissors?"
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        rockButton.isEnabled = true
        paperButton.isEnabled = true
        scissorsButton.isEnabled =  true
        playAgain.isHidden = true
    }
    
    func play(_ playerTurn: Sign) {
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled =  false
        
        let opponent = randomSign()
        appSign.text = opponent.emoji
        
        let gameResult = playerTurn.takeTurn(_opponent: opponent)
        switch gameResult {
        case .draw:
            gameStatus.text = "It's a draw."
        case .lose:
            gameStatus.text = "Sorry! You lose!"
        case .win:
            gameStatus.text = "You win!!"
        case .start:
            gameStatus.text = "Rock, Paper, Scissors?"
        }
        
        switch playerTurn {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
        }
        playAgain.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

