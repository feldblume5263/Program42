//
//  ViewController.swift
//  HelloWorld
//
//  Created by yeo on 2020/04/21.
//  Copyright © 2020 Program42. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func showMessage(sender: UIButton)
    {
        let senderBox = sender
        
        if let wordToLookup = senderBox.titleLabel?.text
        {
            let meaning = wordToLookup
            let alertController = UIAlertController(title: meaning, message: "42", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "KO", style: UIAlertAction.Style.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }

}
