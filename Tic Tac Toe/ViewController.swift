//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Luis Angel on 5/7/16.
//  Copyright © 2016 nysertxs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1
    
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    var moves = 0
    
    let winningCombination = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]

    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    
    @IBAction func btnPressed(sender: AnyObject) {
        
        if gameState[sender.tag] == 0 {

            var image = UIImage()
            
            if activePlayer == 1 {
                image = UIImage(named: "cross.png")!
                activePlayer = 2
            } else {
                image = UIImage(named: "nought.png")!
                activePlayer = 1
            }
            
            moves++
            
            gameState[sender.tag] = activePlayer
            
            sender.setImage(image, forState: UIControlState.Normal)
            
            for (var i = 0; i < winningCombination.count; i++) {
                
                var arrayResults = [0,0,0]
                
                for (var j = 0; j < winningCombination[j].count; j++) {
                     arrayResults[j] = (winningCombination[i][j]);
                }
                
                if gameState[arrayResults[0]] == 1 && gameState[arrayResults[1]] == 1 && gameState[arrayResults[2]] == 1{
                    let alertController = UIAlertController(title: "Player 1 has won", message: "Player 1 has won", preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
                        self.resetGame()
                    }))
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
                
                if gameState[arrayResults[0]] == 2 && gameState[arrayResults[1]] == 2 && gameState[arrayResults[2]] == 2 {
                    let alertController = UIAlertController(title: "Player 2 has won", message: "Player 2 has won", preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
                        self.resetGame()
                    }))
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
                
            }
            
        }
        
        if (moves >= 9 && gameState != [0,0,0,0,0,0,0,0,0]) {
            let alertController = UIAlertController(title: "Tie", message: "Tie", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
                self.resetGame()
            }))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
    }
    
    func resetGame(){
        moves = 0
        gameState = [0,0,0,0,0,0,0,0,0]
        btn0.setImage(nil, forState: UIControlState.Normal)
        btn1.setImage(nil, forState: UIControlState.Normal)
        btn2.setImage(nil, forState: UIControlState.Normal)
        btn3.setImage(nil, forState: UIControlState.Normal)
        btn4.setImage(nil, forState: UIControlState.Normal)
        btn5.setImage(nil, forState: UIControlState.Normal)
        btn6.setImage(nil, forState: UIControlState.Normal)
        btn7.setImage(nil, forState: UIControlState.Normal)
        btn8.setImage(nil, forState: UIControlState.Normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

