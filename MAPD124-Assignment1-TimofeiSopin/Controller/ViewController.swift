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
    @IBOutlet weak var betBtnUp: UIButton!
    @IBOutlet weak var betBtnDown: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    
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
        //        jackPotAmount = 5000
        //        jackpotLabel.text = "\(jackPotAmount)"
        spinButton.isEnabled = true
        betBtnUp.isEnabled = true
        betBtnDown.isEnabled = true
        
        firstSlotImageView.image = UIImage(named: "default.png")
        secondSlotImageView.image = UIImage(named: "default.png")
        thirdSlotImageView.image = UIImage(named: "default.png")
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
        
        game()
        impact.impactOccurred()
        playSound()
        
        
        if userMoneyLabel.text == "Game Over" {
            spinButton.isEnabled = false
            betBtnUp.isEnabled = false
            betBtnDown.isEnabled = false
            
            firstSlotImageView.image = UIImage(named: "fail.png")
            secondSlotImageView.image = UIImage(named: "fail.png")
            thirdSlotImageView.image = UIImage(named: "fail.png")
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
            } else if userMoney < currentBet {
                
            }
        }
        impact.impactOccurred()
    }
    
    
    
    
    
    //// Game function
    func game() {
        
        if firstSlot == 2 && secondSlot == 2 && secondSlot == 2  {
            
            userMoney = userMoney + jackPotAmount
            userMoneyLabel.text = "\(userMoney)"
            jackPotAmount = 0
            jackpotLabel.text = "\(jackPotAmount)"
            print("JACKPOT")
            
        }
        else if firstSlot == 0 && secondSlot == 0 || secondSlot == 0 && thirdSlot == 0 || firstSlot == 0 && thirdSlot == 0 {
            
            userMoney = userMoney + currentBet * 2
            userMoneyLabel.text = "\(userMoney)"
            print("Les Paul x2")
            
        }
        else if firstSlot == 1 && secondSlot == 1 || secondSlot == 1 && thirdSlot == 1 || firstSlot == 1 && thirdSlot == 1 {
            
            userMoney = userMoney + currentBet * 3
            userMoneyLabel.text = "\(userMoney)"
            print("Explorer x2")
        }
        else if firstSlot == 2 && secondSlot == 2 || secondSlot == 2 && thirdSlot == 2 || firstSlot == 2 && thirdSlot == 2 {
            
            userMoney = userMoney + currentBet * 15
            userMoneyLabel.text = "\(userMoney)"
            print("Marshall x2")
        }
        else if firstSlot == 3 && secondSlot == 3 || secondSlot == 3 && thirdSlot == 3 || firstSlot == 3 && thirdSlot == 3 {
            
            userMoney = userMoney + currentBet * 10
            userMoneyLabel.text = "\(userMoney)"
            print("Pick x2")
        }
        else if firstSlot == 4 && secondSlot == 4 || secondSlot == 4 && thirdSlot == 4 || firstSlot == 4 && thirdSlot == 4 {
            
            userMoney = userMoney + currentBet * 7
            userMoneyLabel.text = "\(userMoney)"
            print("RZK x2")
        }
        else if firstSlot == 5 && secondSlot == 5 || secondSlot == 5 && thirdSlot == 5 || firstSlot == 5 && thirdSlot == 5 {
            
            userMoney = userMoney + currentBet * 2
            userMoneyLabel.text = "\(userMoney)"
            print("SG x2")
        }
        else if firstSlot == 6 && secondSlot == 6 || secondSlot == 6 && thirdSlot == 6 || firstSlot == 6 && thirdSlot == 6 {
            
            userMoney = userMoney + currentBet * 5
            userMoneyLabel.text = "\(userMoney)"
            print("Telec x2")
        }
        else if firstSlot == 7 && secondSlot == 7 || secondSlot == 7 && thirdSlot == 7 || firstSlot == 7 && thirdSlot == 7 {
            
            userMoney = userMoney + currentBet * 8
            userMoneyLabel.text = "\(userMoney)"
            print("Axis x2")
        }
        else if  firstSlot == 0 && secondSlot == 0 && thirdSlot == 0 {
            
            userMoney = userMoney + currentBet * 10
            userMoneyLabel.text = "\(userMoney)"
            print("Les Paul x3")
            
        }
        else if firstSlot == 1 && secondSlot == 1 && thirdSlot == 1 {
            
            userMoney = userMoney + currentBet * 15
            userMoneyLabel.text = "\(userMoney)"
            print("Explorer x3")
        }
            
        else if firstSlot == 3 && secondSlot == 3 && thirdSlot == 3 {
            
            userMoney = userMoney + currentBet * 100
            userMoneyLabel.text = "\(userMoney)"
            print("Marshall x3")
        }
        else if firstSlot == 4 && secondSlot == 4 && thirdSlot == 4 {
            
            userMoney = userMoney + currentBet * 30
            userMoneyLabel.text = "\(userMoney)"
            print("RZK x3")
        }
        else if firstSlot == 5 && secondSlot == 5 && thirdSlot == 5 {
            
            userMoney = userMoney + currentBet * 70
            userMoneyLabel.text = "\(userMoney)"
            print("SG x3")
        }
        else if firstSlot == 6 && secondSlot == 6 && thirdSlot == 6 {
            
            userMoney = userMoney + currentBet * 25
            userMoneyLabel.text = "\(userMoney)"
            print("Telec x3")
        }
        else if firstSlot == 6 && secondSlot == 6 && thirdSlot == 6 {
            
            userMoney = userMoney + currentBet * 90
            userMoneyLabel.text = "\(userMoney)"
            print("Axis x3")
        }
        else {
            
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
        jackPotAmount = 5000
        jackpotLabel.text = "\(jackPotAmount)"
        reset()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


