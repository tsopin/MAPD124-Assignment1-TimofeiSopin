//
//  ViewController.swift
//  MAPD124-Assignment1-TimofeiSopin
//
//  Created by Timofei Sopin on 2018-01-28.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let impact = UIImpactFeedbackGenerator()
    
    
    @IBOutlet weak var jackpotLabel: UILabel!
    @IBOutlet weak var userMoneyLabel: UILabel!
    @IBOutlet weak var currentBetLabel: UILabel!
    
    @IBOutlet weak var firstSlotImageView: UIImageView!
    @IBOutlet weak var secondSlotImageView: UIImageView!
    @IBOutlet weak var thirdSlotImageView: UIImageView!
    
    @IBOutlet weak var spinButton: UIButton!
    
    // Variables
    
    var firstSlot : Int = 0
    var secondSlot : Int = 0
    var thirdSlot : Int = 0
    var audioPlayer: AVAudioPlayer!
    var currentBet : Int = 0 {
        didSet {
            currentBetLabel.text = "\(currentBet)"
        }
    }
    
    var userMoney : Int = 0
    var jackPotAmount : Int = 0
    let slotArray = ["s1", "s2", "s3", "s4", "s5", "s6", "s7", "s8"]
   
    
    
    
    
    
    // Reset app, set all variables to default
    func reset() {
        userMoney = 100
        userMoneyLabel.text = "\(userMoney)"
        currentBet = 5
        jackPotAmount = 5000
        jackpotLabel.text = "\(jackPotAmount)"
        spinButton.isHidden = false
    }
    
    
    
    
    
    ///////// Play Sound
    func playSound() {
        
        let soundURL = Bundle.main.url(forResource: "bntSnd", withExtension: "wav")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
        
    }
    
    
    
    
    
    // Spin Button
    @IBAction func spinButton(_ sender: Any) {
    
        firstSlot = Int(arc4random_uniform(8))
        secondSlot = Int(arc4random_uniform(8))
        thirdSlot = Int(arc4random_uniform(8))
        
        firstSlotImageView.image = UIImage(named: slotArray[firstSlot])
        secondSlotImageView.image = UIImage(named: slotArray[secondSlot])
        thirdSlotImageView.image = UIImage(named: slotArray[thirdSlot])
        
        impact.impactOccurred()
        playSound()
        game()
        
        if userMoneyLabel.text == "Game Over" {
            spinButton.isHidden = true
        }
    }
    
    
    
    
    
    // Current bet
    @IBAction func currentBetBtn(_ sender: UIButton) {
        
        if sender.tag == 1 {
            
            if currentBet > 5 {
                currentBet -= 5
            }
            
        } else if sender.tag == 2 {
            
            if currentBet < userMoney {
                currentBet += 5
            } else if currentBet > userMoney {
                
                currentBet = userMoney
                currentBetLabel.text = "\(currentBet)"
                }
        }
        impact.impactOccurred()
    }
    
    
    
    
    
    //// Game function
    func game() {
        
        if (firstSlot == secondSlot && secondSlot == thirdSlot)  {
            
            userMoney = userMoney + jackPotAmount
            userMoneyLabel.text = "\(userMoney)"
            jackPotAmount = 0
            jackpotLabel.text = "\(jackPotAmount)"
            
        } else if firstSlot == secondSlot || firstSlot == thirdSlot || secondSlot == thirdSlot  {
            
            userMoney = userMoney + currentBet * 2
            userMoneyLabel.text = "\(userMoney)"
            
        } else {
            
            if userMoney > currentBet {
            userMoney = userMoney - currentBet
            userMoneyLabel.text = "\(userMoney)"
            jackPotAmount = jackPotAmount + currentBet
            jackpotLabel.text = "\(jackPotAmount)"
            } else {
                userMoneyLabel.text = "Game Over"
                currentBetLabel.text = "-"
               
            }
        }
    }
    

    //// Reset Button
    @IBAction func resetBtn(_ sender: UIButton) {
        impact.impactOccurred()
        reset()
    }
    
    
    
    //////// Quit button
    @IBAction func quitButton(_ sender: UIButton) {
        impact.impactOccurred()
        UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

