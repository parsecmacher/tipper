//
//  TipConstants.swift
//  tipper
//
//  Created by Mostajo, Dante on 3/10/17.
//  Copyright © 2017 Mostajo, Dante. All rights reserved.
//

import Foundation

class Tip {
    static let tipPercentages = [0.15, 0.18, 0.22]
    static let userDefaultsKey = "tipper_settings_default_tip"
    
    static func getUserDefaultTipPercentage() -> Double {
        let defaults = UserDefaults.standard
        
        let defaultTipPercentage = 0.15
        
        if let tipPercentValue = defaults.object(forKey: Tip.userDefaultsKey) {
            return tipPercentValue as! Double
        } else {
            return defaultTipPercentage
        }
    }
    
    static func getUserDefaultTipPercentageIndex() -> Int {
        let tipPercentage = Tip.getUserDefaultTipPercentage();

        if let tipPercentIndex = Tip.tipPercentages.index(of: tipPercentage) {
            return tipPercentIndex
        } else {
            return 0;
        }
    }
    
    static func saveUserDefaultTipPercentage(tipPercent: Double) {
        let defaults = UserDefaults.standard
        
        defaults.set(tipPercent, forKey: Tip.userDefaultsKey)
        defaults.synchronize()
    }
}
