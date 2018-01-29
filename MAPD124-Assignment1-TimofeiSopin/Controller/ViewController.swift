//
//  ViewController.swift
//  MAPD124-Assignment1-TimofeiSopin
//
//  Created by Timofei Sopin on 2018-01-28.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var jackpotLabel: UILabel!
    @IBOutlet weak var userMoneyLabel: UILabel!
    @IBOutlet weak var currentBetLabel: UILabel!
    
    @IBOutlet weak var firstSlotImageView: UIImageView!
    @IBOutlet weak var secondSlotImageView: UIImageView!
    @IBOutlet weak var thirdSlotImageView: UIImageView!
    
    var firstSlot : Int = 0
    var secondSlot : Int = 0
    var thirdSlot : Int = 0
    
    var currentBet : Int = 0 {
        didSet {
            currentBetLabel.text = "\(currentBet)"
        }
        
    }
    var userMoney : Int = 0
    
    let slotArray = ["s1", "s2", "s3", "s4", "s5", "s6", "s7"]
    
    func reset() {
        userMoneyLabel.text = "\(userMoney + 100)"
        currentBetLabel.text = "\(5)"
        jackpotLabel.text = "\(0)"
    }
    
    
    @IBAction func spinButton(_ sender: Any) {
        
        firstSlot = Int(arc4random_uniform(7))
        secondSlot = Int(arc4random_uniform(7))
        thirdSlot = Int(arc4random_uniform(7))
        
        firstSlotImageView.image = UIImage(named: slotArray[firstSlot])
        secondSlotImageView.image = UIImage(named: slotArray[secondSlot])
        thirdSlotImageView.image = UIImage(named: slotArray[thirdSlot])
        
    }
    
    
    @IBAction func currentBetBtn(_ sender: UIButton) {
        
        if sender.tag == 1 {
            
            if currentBet > 0 {
            
                currentBet -= 5}
            
        } else if sender.tag == 2{
            currentBet += 5
        }
        
    }
    
    @IBAction func resetBtn(_ sender: UIButton) {
        reset()
    }
    
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

