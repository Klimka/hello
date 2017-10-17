//
//  ViewController.swift
//  iOS-App-Lesson1
//
//  Created by Клим Зелинский on 15.10.17.
//  Copyright © 2017 Клим Зелинский. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var loginFieldConnect: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(_ sender: Any) {
   print("кнопка нажалась!")
    }
    
}

