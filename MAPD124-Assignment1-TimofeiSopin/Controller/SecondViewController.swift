//
//  SecondViewController.swift
//  MAPD124-Assignment1-TimofeiSopin
//
//  Created by Timofei Sopin on 2018-02-01.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let impact = UIImpactFeedbackGenerator()
    
    @IBAction func quitSecond(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        impact.impactOccurred()

    }
    
    
}

