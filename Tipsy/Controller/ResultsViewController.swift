//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Ishaan Sarna on 27/09/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var amount: String = "123.56";
    var tip: Int = 10;
    var people: Int = 2;
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = amount;
        settingsLabel.text = String(format: "Split between %d people, with %d%% tip.", people, tip)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
