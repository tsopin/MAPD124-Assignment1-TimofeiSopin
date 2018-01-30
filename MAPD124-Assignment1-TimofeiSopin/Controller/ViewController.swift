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
    
    @IBOutlet weak var jackpotLabel: UILabel!
    @IBOutlet weak var userMoneyLabel: UILabel!
    @IBOutlet weak var currentBetLabel: UILabel!
    
    @IBOutlet weak var firstSlotImageView: UIImageView!
    @IBOutlet weak var secondSlotImageView: UIImageView!
    @IBOutlet weak var thirdSlotImageView: UIImageView!
    
    
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
    
    var userMoney : Int = 0  {
        didSet {
            userMoneyLabel.text = "\(userMoney)"
        }
    }
    var jackPotAmount : Int = 0 {
        didSet {
            jackpotLabel.text = "\(jackPotAmount)"
        }
    }
    let slotArray = ["s1", "s2", "s3", "s4", "s5", "s6", "s7"]
    
    
    // Reset app, set all variables to default
    func reset() {
        userMoney = userMoney + 1000
        userMoneyLabel.text = "\(userMoney)"
        //        currentBetLabel.text = "\(5)"
        currentBet = 5
        jackPotAmount = 5000
        jackpotLabel.text = "\(jackPotAmount)"
    }
    
    
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
        
        firstSlot = Int(arc4random_uniform(7))
        secondSlot = Int(arc4random_uniform(7))
        thirdSlot = Int(arc4random_uniform(7))
        
        firstSlotImageView.image = UIImage(named: slotArray[firstSlot])
        secondSlotImageView.image = UIImage(named: slotArray[secondSlot])
        thirdSlotImageView.image = UIImage(named: slotArray[thirdSlot])
        
        playSound()
        game()
    }
    
    // Current bet
    @IBAction func currentBetBtn(_ sender: UIButton) {
        
        if sender.tag == 1 {
            
            if currentBet > 0 {
                currentBet -= 5
            }
            
        } else if sender.tag == 2 {
            currentBet += 5
        }
    }
    
    
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
            
            userMoney = userMoney - currentBet
            userMoneyLabel.text = "\(userMoney)"
            jackPotAmount = jackPotAmount + currentBet
            jackpotLabel.text = "\(jackPotAmount)"
            
        }
    }
    
    
    @IBAction func resetBtn(_ sender: UIButton) {
        reset()
    }
    // Quit button
    @IBAction func quitButton(_ sender: UIButton) {
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

