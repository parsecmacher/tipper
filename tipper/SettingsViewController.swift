//
//  SettingsViewController.swift
//  tipper
//
//  Created by Mostajo, Dante on 3/7/17.
//  Copyright © 2017 Mostajo, Dante. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipPercentagesControl: UISegmentedControl!
        
    
    @IBAction func saveDefaultTip(_ sender: AnyObject) {
        let tipPercent = Tip.tipPercentages[tipPercentagesControl.selectedSegmentIndex]
        
        Tip.saveUserDefaultTipPercentage(tipPercent: tipPercent)
    }

    func initSegmentedControlWithDefaultIndex() {
        tipPercentagesControl.selectedSegmentIndex = Tip.getUserDefaultTipPercentageIndex()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initSegmentedControlWithDefaultIndex()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
