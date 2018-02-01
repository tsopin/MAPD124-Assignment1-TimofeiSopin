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
    
  ///////////////////////////////////Variables///////////////////////////////////////
    
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
    let slotArray = ["s1", "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11", "s12"]
    
    var betIn = [0, 0, 0]
    var betResult = [0, 0, 0]
    
    
    
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
    
    
    
    
    
    // Play Sound
    func spinSound() {
        
        let soundURL = Bundle.main.url(forResource: "spin", withExtension: "wav")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
        
    }
    func betSound() {
        
        let soundURL = Bundle.main.url(forResource: "betS", withExtension: "wav")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
        
    }
    
    func gameoverSound() {
        
        let soundURL = Bundle.main.url(forResource: "gameover", withExtension: "wav")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
        
    }
    
    func resetSound() {
        
        let soundURL = Bundle.main.url(forResource: "reset", withExtension: "wav")
        
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
        
        probabilityGenerator()
        firstSlot = Int(betIn[0])
        secondSlot = Int(betIn[1])
        thirdSlot = Int(betIn[2])
        
        firstSlotImageView.image = UIImage(named: slotArray[firstSlot])
        secondSlotImageView.image = UIImage(named: slotArray[secondSlot])
        thirdSlotImageView.image = UIImage(named: slotArray[thirdSlot])
        
        print("- - - - - - - - - -")
        print(betIn[0])
        print(betIn[1])
        print(betIn[2])
        
        
        game()
        impact.impactOccurred()
        spinSound()
        
        
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
        betSound()
        impact.impactOccurred()
    }
    
    
    
    
    
    // Game function
    func game() {
        
        if firstSlot == 2 && secondSlot == 2 && thirdSlot == 2  {
            
            userMoney = userMoney + jackPotAmount
            userMoneyLabel.text = "\(userMoney)"
            jackPotAmount = 0
            jackpotLabel.text = "\(jackPotAmount)"
            print("JACKPOT")
            
        }
            
        // Checking for x3
            

            
        else if  firstSlot == 0 && secondSlot == 0 && thirdSlot == 0 {
            
            userMoney = userMoney + currentBet * 8
            userMoneyLabel.text = "\(userMoney)"
            print("Les Paul x3")
            
        }
        else if firstSlot == 1 && secondSlot == 1 && thirdSlot == 1 {
            
            userMoney = userMoney + currentBet * 8
            userMoneyLabel.text = "\(userMoney)"
            print("Explorer x3")
        }
            
        else if firstSlot == 3 && secondSlot == 3 && thirdSlot == 3 {
            
            userMoney = userMoney + currentBet * 10
            userMoneyLabel.text = "\(userMoney)"
            print("Ural x3")
        }
        else if firstSlot == 4 && secondSlot == 4 && thirdSlot == 4 {
            
            userMoney = userMoney + currentBet * 12
            userMoneyLabel.text = "\(userMoney)"
            print("RZK x3")
        }
        else if firstSlot == 5 && secondSlot == 5 && thirdSlot == 5 {
            
            userMoney = userMoney + currentBet * 14
            userMoneyLabel.text = "\(userMoney)"
            print("SG x3")
        }
        else if firstSlot == 6 && secondSlot == 6 && thirdSlot == 6 {
            
            userMoney = userMoney + currentBet * 15
            userMoneyLabel.text = "\(userMoney)"
            print("Telec x3")
        }
        else if firstSlot == 7 && secondSlot == 7 && thirdSlot == 7 {
            
            userMoney = userMoney + currentBet * 20
            userMoneyLabel.text = "\(userMoney)"
            print("Axis x3")
        }
        else if firstSlot == 8 && secondSlot == 8 && thirdSlot == 8 {
            
            userMoney = userMoney + currentBet * 25
            userMoneyLabel.text = "\(userMoney)"
            print("Strat x3")
        }
        else if firstSlot == 9 && secondSlot == 9 && thirdSlot == 9 {
            
            userMoney = userMoney + currentBet * 30
            userMoneyLabel.text = "\(userMoney)"
            print("V x3")
        }
        else if firstSlot == 10 && secondSlot == 10 && thirdSlot == 10 {
            
            userMoney = userMoney + currentBet * 40
            userMoneyLabel.text = "\(userMoney)"
            print("Het x3")
        }
        else if firstSlot == 11 && secondSlot == 11 && thirdSlot == 11 {
            
            userMoney = userMoney + currentBet * 50
            userMoneyLabel.text = "\(userMoney)"
            print("RzkW x3")
        }
      
            
        // Checking for x2
            

            
        else if firstSlot == 0 && secondSlot == 0 || secondSlot == 0 && thirdSlot == 0 || firstSlot == 0 && thirdSlot == 0 {
            
            userMoney = userMoney + currentBet * 2
            userMoneyLabel.text = "\(userMoney)"
            print("Les Paul x2")
            
        }
        else if firstSlot == 1 && secondSlot == 1 || secondSlot == 1 && thirdSlot == 1 || firstSlot == 1 && thirdSlot == 1 {
            
            userMoney = userMoney + currentBet * 2
            userMoneyLabel.text = "\(userMoney)"
            print("Explorer x2")
        }
        else if firstSlot == 2 && secondSlot == 2 || secondSlot == 2 && thirdSlot == 2 || firstSlot == 2 && thirdSlot == 2 {
            
            userMoney = userMoney + currentBet * 3
            userMoneyLabel.text = "\(userMoney)"
            print("Marshall x2")
        }
        else if firstSlot == 3 && secondSlot == 3 || secondSlot == 3 && thirdSlot == 3 || firstSlot == 3 && thirdSlot == 3 {
            
            userMoney = userMoney + currentBet * 3
            userMoneyLabel.text = "\(userMoney)"
            print("Ural x2")
        }
        else if firstSlot == 4 && secondSlot == 4 || secondSlot == 4 && thirdSlot == 4 || firstSlot == 4 && thirdSlot == 4 {
            
            userMoney = userMoney + currentBet * 4
            userMoneyLabel.text = "\(userMoney)"
            print("RZK x2")
        }
        else if firstSlot == 5 && secondSlot == 5 || secondSlot == 5 && thirdSlot == 5 || firstSlot == 5 && thirdSlot == 5 {
            
            userMoney = userMoney + currentBet * 5
            userMoneyLabel.text = "\(userMoney)"
            print("SG x2")
        }
        else if firstSlot == 6 && secondSlot == 6 || secondSlot == 6 && thirdSlot == 6 || firstSlot == 6 && thirdSlot == 6 {
            
            userMoney = userMoney + currentBet * 5
            userMoneyLabel.text = "\(userMoney)"
            print("Telec x2")
        }
        else if firstSlot == 7 && secondSlot == 7 || secondSlot == 7 && thirdSlot == 7 || firstSlot == 7 && thirdSlot == 7 {
            
            userMoney = userMoney + currentBet * 6
            userMoneyLabel.text = "\(userMoney)"
            print("Axis x2")
        }
        else if firstSlot == 8 && secondSlot == 8 || secondSlot == 8 && thirdSlot == 8 || firstSlot == 8 && thirdSlot == 8 {
            
            userMoney = userMoney + currentBet * 7
            userMoneyLabel.text = "\(userMoney)"
            print("Strat x2")
        }
        else if firstSlot == 9 && secondSlot == 9 || secondSlot == 9 && thirdSlot == 9 || firstSlot == 9 && thirdSlot == 9 {
            
            userMoney = userMoney + currentBet * 8
            userMoneyLabel.text = "\(userMoney)"
            print("V x2")
        }
        else if firstSlot == 10 && secondSlot == 10 || secondSlot == 10 && thirdSlot == 10 || firstSlot == 10 && thirdSlot == 10 {
            
            userMoney = userMoney + currentBet * 8
            userMoneyLabel.text = "\(userMoney)"
            print("Het x2")
        }
        else if firstSlot == 11 && secondSlot == 11 || secondSlot == 11 && thirdSlot == 11 || firstSlot == 11 && thirdSlot == 11 {
            
            userMoney = userMoney + currentBet * 10
            userMoneyLabel.text = "\(userMoney)"
            print("RzkW x2")
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
                gameoverSound()
                
            }
        }
    }
    
    
    
    func chance(value: Int, minLimit: Int, maxLimit: Int) -> Int {
        if (value >= minLimit && value <= maxLimit)
        {
            return value
        }
        else {
            return 0
        }
    }
    
    func probabilityGenerator() -> [Int] {
    
        for spin in 0..<3 {
            betResult[spin] = (Int(arc4random_uniform(100) + 1))
            switch (betResult[spin]) {
                
            case chance(value: betResult[spin], minLimit: 1, maxLimit: 14): // chance 0,15
                betIn[spin] = 0
              
            case chance(value: betResult[spin], minLimit: 15, maxLimit: 30): // chance 0,14
                betIn[spin] = 1
        
            case chance(value: betResult[spin], minLimit: 31, maxLimit: 42): // chance 0,12
                betIn[spin] = 2
        
            case chance(value: betResult[spin], minLimit: 43, maxLimit: 53): // chance 0,11
                betIn[spin] = 3
                
            case chance(value: betResult[spin], minLimit: 54, maxLimit: 63): // chance 0,10
                betIn[spin] = 4
               
            case chance(value: betResult[spin], minLimit: 64, maxLimit: 72): // chance 0,09
                betIn[spin] = 5
            
            case chance(value: betResult[spin], minLimit: 63, maxLimit: 79): // chance 0,08
                betIn[spin] = 6
              
            case chance(value: betResult[spin], minLimit: 80, maxLimit: 85): // chance 0,07
                betIn[spin] = 7
               
            case chance(value: betResult[spin], minLimit: 86, maxLimit: 90): // chance 0,06
                betIn[spin] = 8
              
            case chance(value: betResult[spin], minLimit: 91, maxLimit: 94): // chance 0,04
                betIn[spin] = 9
                
            case chance(value: betResult[spin], minLimit: 95, maxLimit: 97): // chance 0,03
                betIn[spin] = 10
               
            case chance(value: betResult[spin], minLimit: 98, maxLimit: 100): // chance 0,01
                betIn[spin] = 11
                
            default: break
                
            }
        }
        return betIn
        
    }
    
    
    //// Reset Button
    @IBAction func resetBtn(_ sender: UIButton) {
        impact.impactOccurred()
        reset()
        resetSound()
    }

    
    //////// Quit button
    @IBAction func quitButton(_ sender: UIButton) {
        impact.impactOccurred()
        UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jackPotAmount = 10000
        jackpotLabel.text = "\(jackPotAmount)"
        reset()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


