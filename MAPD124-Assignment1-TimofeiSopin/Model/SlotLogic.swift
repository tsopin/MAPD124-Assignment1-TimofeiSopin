////
////  SlotLogic.swift
////  MAPD124-Assignment1-TimofeiSopin
////
////  Created by Timofei Sopin on 2018-01-31.
////  Copyright © 2018 Centennial College. All rights reserved.
////
//
//import Foundation
//
//class SlotLogic: ViewController {
//
//    func chance(value: Int, minLimit: Int, maxLimit: Int) -> Int {
//        if (value >= minLimit && value <= maxLimit)
//        {
//            return value
//        }
//        else {
//            return 0
//        }
//    }
//    
//    func probabilityGenerator() -> String {
//        var betLine = [" ", " ", " "]
//        var outCome = [0, 0, 0]
//        
//        var blanks = 0
//        var grapes = 0
//        //    var bananas = 0
//        //    var oranges = 0
//        //    var cherries = 0
//        //    var bars = 0
//        //    var bells = 0
//        //    var sevens = 0
//        
//        
//        for spin in 0..<3 {
//            outCome[spin] = (Int(arc4random_uniform(65) + 1))
//            switch (outCome[spin]) {
//                
//            case chance(value: outCome[spin], minLimit: 1, maxLimit: 27):  // 41.5% probability
//                betLine[spin] = "Les Paul"
//                blanks = blanks + 1
//                
//            case chance(value: outCome[spin], minLimit: 28, maxLimit: 37): // 15.4% probability
//                betLine[spin] = "Explorer"
//                grapes = grapes + 1
//                
//            case chance(value: outCome[spin], minLimit: 38, maxLimit: 46): // 13.8% probability
//                betLine[spin] = "Pick"
//                grapes = grapes + 1
//                
//            case chance(value: outCome[spin], minLimit: 47, maxLimit: 54): // 12.3% probability
//                betLine[spin] = "Rzk"
//                grapes = grapes + 1
//                
//            case chance(value: outCome[spin], minLimit: 55, maxLimit: 59): // 7.7% probability
//                betLine[spin] = "Telecaster"
//                grapes = grapes + 1
//                
//            case chance(value: outCome[spin], minLimit: 60, maxLimit: 62): // 4.6% probability
//                betLine[spin] = "SG"
//                grapes = grapes + 1
//                
//            case chance(value: outCome[spin], minLimit: 63, maxLimit: 64): // 3.1% probability
//                betLine[spin] = "Axis"
//                grapes = grapes + 1
//                
//            case chance(value: outCome[spin], minLimit: 65, maxLimit: 65): //  1.5% probability
//                betLine[spin] = "Marshall"
//                grapes = grapes + 1
//                
//                
//            default: break
//                
//            }
//        }
//        return "\(betLine)"
//        
//    }
//    
//   probabilityGenerator()
//
//    
//    
//}
//
