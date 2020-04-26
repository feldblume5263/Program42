//
//  ViewController.swift
//  HelloWorld
//
//  Created by 박준홍 on 2020/04/21.
//  Copyright © 2020 42Seoul. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
    }
    
    @IBAction func showMessage(sender: UIButton)
    {
        let selectedButton = sender
        
        if let wordToLookup = selectedButton.titleLabel?.text
        {
            let emojiDict: [String:String] = ["🥰": "Love", "😘": "Kiss", "😆": "Joy", "😇": "Good"]
            let meaning = emojiDict[wordToLookup]
            let alertController = UIAlertController(title: "Are you feeling", message: meaning! + "?", preferredStyle: UIAlertController.Style.alert)
        
            alertController.addAction(UIAlertAction(title: "close", style: UIAlertAction.Style.default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    }
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
