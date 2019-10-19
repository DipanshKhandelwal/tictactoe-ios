//
//  ViewController.swift
//  tictactoe-ios
//
//  Created by Dipansh Khandelwal on 07/10/19.
//  Copyright © 2019 DipanshKhandelwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!

    var buttons : Array<UIButton> = []
    // for storing all UIButtons

    @IBOutlet weak var turnLabel: UILabel!
    // Turn label and Win status
    
    
    var turn = true
    // true = X
    // false = y
    
    var win = false
    
    var gameState = [ -1, -1, -1, -1, -1, -1, -1, -1 ]
    // Save state of game
    
    let winningStates = [ [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6] ];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [ zero, one, two, three, four, five, six, seven, eight ]
        initialize()
    }
    
    func initialize() {
        gameState = [ -1, -1, -1, -1, -1, -1, -1, -1, -1 ]
        for button in buttons {
            button.setTitle("", for: .normal)
        }
        win = false
        turn = true
        turnLabel.text = "X"
    }

    @IBAction func move(_ sender: UIButton) {
        if(gameState[sender.tag] != -1 || win) {
            return
        }

        // UI Changes
        if(turn) {
            sender.setTitle("X", for: .normal)
            sender.setTitleColor(.red, for: .normal)
            turnLabel.text = "O"
            gameState[sender.tag] = 1
        } else {
            sender.setTitle("O", for: .normal)
            sender.setTitleColor(.green, for: .normal)
            turnLabel.text = "X"
            gameState[sender.tag] = 0
        }
        
        
        for state in winningStates {
            if(gameState[state[0]] == gameState[state[1]] && gameState[state[1]] == gameState[state[2]] && gameState[state[0]] != -1 ) {
                if(turn) {
                    turnLabel.text = "Player X Won !!"
                } else {
                    turnLabel.text = "Player Y Won !!"
                }
                win = true
            }
        }
        
        for i in 0...8 {
            if(gameState[i] == -1) {break}
            else {
                if(i==8) {
                    turnLabel.text = "Tie !!"
                }
            }
        }
        
        turn = !turn
    }
    
    @IBAction func reset(_ sender: Any) {
        initialize()
    }
}
