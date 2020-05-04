//
//  ViewController.swift
//  deligatepractice
//
//  Created by 박준홍 on 2020/05/04.
//  Copyright © 2020 42Seoul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var enteredLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    //@IBAction func buttonClicked(_ sender: Any) {
    //    enteredLabel.text = textField.text
    //}
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        enteredLabel.text = textField.text
        
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }


}

