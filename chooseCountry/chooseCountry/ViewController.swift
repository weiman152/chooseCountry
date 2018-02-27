//
//  ViewController.swift
//  chooseCountry
//
//  Created by iOS on 2018/2/26.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countryTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func chooseCountryBegin(_ sender: UITextField) {
        let chooseCountryVC = ChooseCountryController()
        present(chooseCountryVC, animated: true) {
            print("跳到选择国家页面")
        }
    }
    
}

