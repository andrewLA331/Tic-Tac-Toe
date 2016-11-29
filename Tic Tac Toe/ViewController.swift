//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Andrew Allen on 5/16/16.
//  Copyright © 2016 Andrew Boyd Allen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 // 1= nought 2 = cross
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    
    var gameActive = true
    @IBOutlet var playAgainOut: UIButton!

    @IBAction func playAgain(sender: AnyObject) {
        
       gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
       activePlayer = 1
       gameActive = true
        
       playAgainOut.hidden = true
        
       playAgainOut.center = CGPointMake(playAgainOut.center.x - 500, playAgainOut.center.y)
       
       result.text = ""
        
        var buttonToClear : UIButton
        
        for var i = 0; i < 9; i += 1 {
            
            buttonToClear = view.viewWithTag(i) as! UIButton
            
            buttonToClear.setImage(nil, forState: .Normal)
        }
        
       
        
    }
    @IBOutlet var buttonImage: UIButton!
    
    @IBOutlet var result: UILabel!
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if(gameState[sender.tag] == 0 && gameActive == true) {
            
            gameState[sender.tag] = activePlayer
            
            if activePlayer == 1 {
            
                sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
            
                activePlayer = 2
            
            } else {
                sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
            
                activePlayer = 1
            }
            
            for combination in winningCombinations {
                
                if(gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]) {
                    
                    if(gameState[combination[0]] == 1) {
                        
                        result.text = "Noughts won."
                        gameActive = false
                    }
                    
                    else if(gameState[combination[0]] == 2) {
                        
                        result.text = "Crosses won."
                        gameActive = false
                    }
                    
                    endGame()
                }
            }
            
            if gameActive == true {
                
                gameActive = false
            
                for buttonState in gameState {
                
                    if buttonState == 0 {
                    
                        gameActive = true
                    }
                
                }
            
                if gameActive == false {
                
                    result.text = "It's a draw."
                
                    endGame()
                }
            }
        }
    }
    
    func endGame() {
        
        playAgainOut.hidden = false
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.playAgainOut.center = CGPointMake(self.playAgainOut.center.x + 500, self.playAgainOut.center.y)
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playAgainOut.hidden = true
        
        playAgainOut.center = CGPointMake(playAgainOut.center.x - 500, playAgainOut.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

