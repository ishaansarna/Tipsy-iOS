//
//  Calculator.swift
//  Tipsy
//
//  Created by Ishaan Sarna on 27/09/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Calculator {
    func calculateTip(billAmount: Float, tipAmount: Int, splitPeople: Int) -> String {
        let total: Float = billAmount + ((billAmount*Float(tipAmount))/100);
        let perPersonAmount: Float = total/Float(splitPeople);
        return String(format: "%.2f", perPersonAmount);
    }
}
