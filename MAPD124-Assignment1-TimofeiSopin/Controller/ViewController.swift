//
//  ViewController.swift
//
//  Created by Timofei Sopin on 2018-01-28.
//  Student ID 300965775

//  Advanced iOS Programming - Assignment 1 Swift Slot Machine
//  Ver. 1.0.6
//  Copyright © 2018 Centennial College. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
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
    
    //Variables
    let impact = UIImpactFeedbackGenerator()
    let slotArray = ["s1", "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11", "s12", "broken"]
   
    var audioPlayer, sundPlay, jackpotPlayer: AVAudioPlayer!
    var firstSlot : Int = 0
    var secondSlot : Int = 0
    var thirdSlot : Int = 0
    var betIn = [0, 0, 0]
    var betResult = [0, 0, 0]
    var currentBet : Int = 0 {
        didSet {
            currentBetLabel.text = "\(currentBet)"
        }
    }
    var userMoney : Int = 0 {
        didSet {
            userMoneyLabel.text = "\(userMoney)"
        }
    }
    var jackPotAmount : Int = 0 {
        didSet {
            jackpotLabel.text = "\(jackPotAmount)"
        }
    }
    
    // Reset app, set all variables to default
    func reset() {
        
        userMoney = 100
        userMoneyLabel.text = "\(userMoney)"
        currentBet = 5
        
        jackPotAmount = 10000
        jackpotLabel.text = "\(jackPotAmount)"
        
        spinButton.isEnabled = true
        betBtnUp.isEnabled = true
        betBtnDown.isEnabled = false
        
        firstSlotImageView.image = UIImage(named: "default.png")
        secondSlotImageView.image = UIImage(named: "default.png")
        thirdSlotImageView.image = UIImage(named: "default.png")
    }
    
    // Play Sound
    func failSound() {
        
        let soundURL = Bundle.main.url(forResource: "nooo", withExtension: "mp3")
        
        do {
            sundPlay = try AVAudioPlayer(contentsOf: soundURL!)
            
            sundPlay.play()
        }
        catch {
            print(error)
        }
    }
    
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
    
    func legendSound() {
        
        let soundURL = Bundle.main.url(forResource: "legend", withExtension: "wav")
        
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
    
    func quitSound() {
        
        let soundURL = Bundle.main.url(forResource: "quit", withExtension: "wav")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
    }
    
    func jackpotSound() {
        
        let soundURL = Bundle.main.url(forResource: "jackpot", withExtension: "wav")
        
        do {
            jackpotPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch {
            print(error)
        }
        jackpotPlayer.play()
    }
    
   
    
    // Checking if user has enough money for bet
    func checkMoneyForBet() {
        
        if userMoney < currentBet {
            
            betBtnUp.isEnabled = false
            betBtnDown.isEnabled = true
            spinButton.isEnabled = false
            
        } else if userMoney == currentBet && userMoney != 5 && currentBet != 5  {
            
            betBtnUp.isEnabled = false
            betBtnDown.isEnabled = true
            spinButton.isEnabled = true
            
        } else if currentBet == 5 && userMoney > currentBet {
            
            betBtnUp.isEnabled = true
            betBtnDown.isEnabled = false
            spinButton.isEnabled = true
            
        } else if currentBet == 5 && userMoney == 5 {
            
            betBtnUp.isEnabled = false
            betBtnDown.isEnabled = false
            spinButton.isEnabled = true
            
        }
            
        else {
            
            betBtnUp.isEnabled = true
            betBtnDown.isEnabled = true
            spinButton.isEnabled = true
        }
    }
    
    // Game function
    func game() {
        
        // Checking for Jackpot
        if firstSlot == 11 && secondSlot == 11 && thirdSlot == 11  {
            
            userMoney = userMoney + jackPotAmount
            jackPotAmount = 0
            jackpotLabel.text = "You WON \(jackPotAmount) !"
            print("JACKPOT")
            jackpotSound()
        }
            
            // Checking for x3
        else if  firstSlot == 0 && secondSlot == 0 && thirdSlot == 0 {
            
            userMoney = userMoney + currentBet * 8
            print("Les Paul x3")
            
        }
        else if firstSlot == 1 && secondSlot == 1 && thirdSlot == 1 {
            
            userMoney = userMoney + currentBet * 8
            print("Explorer x3")
        }
        else if firstSlot == 2 && secondSlot == 2 && thirdSlot == 2 {
            
            userMoney = userMoney + currentBet * 40
            print("RZKw x3")
        }
        else if firstSlot == 3 && secondSlot == 3 && thirdSlot == 3 {
            
            userMoney = userMoney + currentBet * 10
            print("Ural x3")
        }
        else if firstSlot == 4 && secondSlot == 4 && thirdSlot == 4 {
            
            userMoney = userMoney + currentBet * 12
            print("RZK x3")
        }
        else if firstSlot == 5 && secondSlot == 5 && thirdSlot == 5 {
            
            userMoney = userMoney + currentBet * 14
            print("SG x3")
        }
        else if firstSlot == 6 && secondSlot == 6 && thirdSlot == 6 {
            
            userMoney = userMoney + currentBet * 15
            print("Telec x3")
        }
        else if firstSlot == 7 && secondSlot == 7 && thirdSlot == 7 {
            
            userMoney = userMoney + currentBet * 20
            print("Axis x3")
        }
        else if firstSlot == 8 && secondSlot == 8 && thirdSlot == 8 {
            
            userMoney = userMoney + currentBet * 25
            print("Strat x3")
        }
        else if firstSlot == 9 && secondSlot == 9 && thirdSlot == 9 {
            
            userMoney = userMoney + currentBet * 30
            print("V x3")
        }
        else if firstSlot == 10 && secondSlot == 10 && thirdSlot == 10 {
            
            userMoney = userMoney + currentBet * 40
            print("Het x3")
        }
        else if firstSlot == 12 && secondSlot == 12 && thirdSlot == 12 {
            
            userMoney = userMoney + currentBet * 2
            print("Broken x3")
        }
            
            // Checking for x2
        else if firstSlot == 0 && secondSlot == 0 || secondSlot == 0 && thirdSlot == 0 || firstSlot == 0 && thirdSlot == 0 {
            
            userMoney = userMoney + currentBet * 2
            print("Les Paul x2")
        }
        else if firstSlot == 1 && secondSlot == 1 || secondSlot == 1 && thirdSlot == 1 || firstSlot == 1 && thirdSlot == 1 {
            
            userMoney = userMoney + currentBet * 2
            print("Explorer x2")
        }
        else if firstSlot == 2 && secondSlot == 2 || secondSlot == 2 && thirdSlot == 2 || firstSlot == 2 && thirdSlot == 2 {
            
            userMoney = userMoney + currentBet * 10
            print("RZKw x2")
        }
        else if firstSlot == 3 && secondSlot == 3 || secondSlot == 3 && thirdSlot == 3 || firstSlot == 3 && thirdSlot == 3 {
            
            userMoney = userMoney + currentBet * 3
            print("Ural x2")
        }
        else if firstSlot == 4 && secondSlot == 4 || secondSlot == 4 && thirdSlot == 4 || firstSlot == 4 && thirdSlot == 4 {
            
            userMoney = userMoney + currentBet * 4
            print("RZK x2")
        }
        else if firstSlot == 5 && secondSlot == 5 || secondSlot == 5 && thirdSlot == 5 || firstSlot == 5 && thirdSlot == 5 {
            
            userMoney = userMoney + currentBet * 5
            print("SG x2")
        }
        else if firstSlot == 6 && secondSlot == 6 || secondSlot == 6 && thirdSlot == 6 || firstSlot == 6 && thirdSlot == 6 {
            
            userMoney = userMoney + currentBet * 5
            print("Telec x2")
        }
        else if firstSlot == 7 && secondSlot == 7 || secondSlot == 7 && thirdSlot == 7 || firstSlot == 7 && thirdSlot == 7 {
            
            userMoney = userMoney + currentBet * 6
            print("Axis x2")
        }
        else if firstSlot == 8 && secondSlot == 8 || secondSlot == 8 && thirdSlot == 8 || firstSlot == 8 && thirdSlot == 8 {
            
            userMoney = userMoney + currentBet * 7
            print("Strat x2")
        }
        else if firstSlot == 9 && secondSlot == 9 || secondSlot == 9 && thirdSlot == 9 || firstSlot == 9 && thirdSlot == 9 {
            
            userMoney = userMoney + currentBet * 8
            print("V x2")
        }
        else if firstSlot == 10 && secondSlot == 10 || secondSlot == 10 && thirdSlot == 10 || firstSlot == 10 && thirdSlot == 10 {
            
            userMoney = userMoney + currentBet * 9
            print("Het x2")
        }
        else if firstSlot == 11 && secondSlot == 11 || secondSlot == 11 && thirdSlot == 11 || firstSlot == 11 && thirdSlot == 11 {
            
            userMoney = userMoney + currentBet * 11
            print("Marshall x2")
        }
        else if firstSlot == 12 && secondSlot == 12 || secondSlot == 12 && thirdSlot == 12 || firstSlot == 12 && thirdSlot == 12 {
            
            userMoney = userMoney + currentBet
            print("Broken x2")
            
        } else {
            
            if userMoney > currentBet {
                userMoney = userMoney - currentBet
                jackPotAmount = jackPotAmount + currentBet
                
            } else {
                userMoneyLabel.text = "Game Over"
                currentBetLabel.text = "-"
                failSound()
            }
        }
        checkMoneyForBet()
    }
    
    // Function calculates probapility of results
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
                
            case chance(value: betResult[spin], minLimit: 1, maxLimit: 9): // chance 0,09
                betIn[spin] = 0
                
            case chance(value: betResult[spin], minLimit: 10, maxLimit: 17): // chance 0,08
                betIn[spin] = 1
                
            case chance(value: betResult[spin], minLimit: 18, maxLimit: 24): // chance 0,07
                betIn[spin] = 2
                
            case chance(value: betResult[spin], minLimit: 25, maxLimit: 35): // chance 0,06
                betIn[spin] = 3
                
            case chance(value: betResult[spin], minLimit: 36, maxLimit: 43): // chance 0,05
                betIn[spin] = 4
                
            case chance(value: betResult[spin], minLimit: 44, maxLimit: 51): // chance 0,05
                betIn[spin] = 5
                
            case chance(value: betResult[spin], minLimit: 52, maxLimit: 57): // chance 0,05
                betIn[spin] = 6
                
            case chance(value: betResult[spin], minLimit: 58, maxLimit: 63): // chance 0,05
                betIn[spin] = 7
                
            case chance(value: betResult[spin], minLimit: 64, maxLimit: 69): // chance 0,05
                betIn[spin] = 8
                
            case chance(value: betResult[spin], minLimit: 70, maxLimit: 74): // chance 0,04
                betIn[spin] = 9
                
            case chance(value: betResult[spin], minLimit: 75, maxLimit: 78): // chance 0,03
                betIn[spin] = 10
                
            case chance(value: betResult[spin], minLimit: 79, maxLimit: 80): // chance 0,01
                betIn[spin] = 11
                
            default: betIn[spin] = 12
                
            }
        }
        return betIn
    }
    
    // Buttons
    
    // Spin Button
    @IBAction func spinButton(_ sender: Any) {
        
        _ = probabilityGenerator()
        
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
    
    
    // Current bet buttons
    @IBAction func currentBetBtn(_ sender: UIButton) {
        
        if sender.tag == 1 {
            
            if currentBet > 5 && userMoney >= currentBet {
                
                currentBet -= 5
            }
            else if userMoney < currentBet {
                currentBet = userMoney
            }
            
        } else if sender.tag == 2 {
            
            currentBet += 5
        }
        
        checkMoneyForBet()
        betSound()
        impact.impactOccurred()
    }
    
    
    // Reset Button
    @IBAction func resetBtn(_ sender: UIButton) {
        
        reset()
        resetSound()
        
        impact.impactOccurred()
    }
    
    @IBAction func legendButton(_ sender: UIButton) {
        
        let secondVC  = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.present(secondVC, animated:true, completion:nil)
        
        impact.impactOccurred()
        legendSound()
    }
    
    // Quit button
    @IBAction func quitButton(_ sender: UIButton) {
        
        UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
        
        impact.impactOccurred()
        quitSound()
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


