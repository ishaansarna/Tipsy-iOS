//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipAmount: Int = 10;
    let calculator: Calculator = Calculator();
    var finalAmount: String = "0.0";
    var people: Int = 2;
    var billAmount: Float = 123.56;
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false;
        tenPctButton.isSelected = false;
        twentyPctButton.isSelected = false;
        sender.isSelected.toggle();
        billTextField.resignFirstResponder();
        
        switch sender.currentTitle {
        case "0%":
            tipAmount = 0;
        case "10%":
            tipAmount = 10;
        case "20%":
            tipAmount = 20;
        default:
            tipAmount = 0;
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap) // Add gesture recognizer to background view
    }

    @objc func handleTap() {
        billTextField.resignFirstResponder() // dismiss keyoard
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description;
        billTextField.resignFirstResponder()
    }
    @IBAction func calculatePressed(_ sender: Any) {
        billAmount = Float(billTextField.text ?? "0") ?? 123.56;
        people = Int(splitNumberLabel.text ?? "1") ?? 1;
        finalAmount = calculator.calculateTip(billAmount: billAmount, tipAmount: tipAmount, splitPeople: people);
        print(finalAmount);
        performSegue(withIdentifier: "showAmount", sender: nil);
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAmount" {
            if let destination = segue.destination as? ResultsViewController {
                destination.amount = finalAmount;
                destination.people = people;
                destination.tip = tipAmount;
            }
        }
    }
    
}

