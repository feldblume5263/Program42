//
//  ViewController.swift
//  dataTransfer
//
//  Created by user42 on 2020/04/30.
//  Copyright © 2020 Program42. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var input: UITextField!

    var sendData = ""
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneSegue"
        {
            sendData = input.text!
        }
    }
}
