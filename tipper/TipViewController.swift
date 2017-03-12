//
//  TipViewController.swift
//  tipper
//
//  Created by Mostajo, Dante on 3/5/17.
//  Copyright © 2017 Mostajo, Dante. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipPercentagesControl: UISegmentedControl!
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let bill = Double(billField.text!) ?? 0
        let tip = bill * Tip.tipPercentages[tipPercentagesControl.selectedSegmentIndex]
        let total = bill + tip
        
        let fmt = NumberFormatter()
        fmt.numberStyle = .currency
        
        tipLabel.text = fmt.string(for: tip)
        totalLabel.text = fmt.string(for: total)
    }
    
    func initSegmentedControlWithDefaultIndex() {
        tipPercentagesControl.selectedSegmentIndex = Tip.getUserDefaultTipPercentageIndex()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        initSegmentedControlWithDefaultIndex()
        calculateTip(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
    }
}

