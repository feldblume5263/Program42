//
//  SendViewController.swift
//  testfile
//
//  Created by 박준홍 on 2020/05/04.
//  Copyright © 2020 42Seoul. All rights reserved.
//

import UIKit

protocol SendDataDelegate {
    func sendData(data: String)
}

class SendViewController: UIViewController {
    
    var delegate: SendDataDelegate?
    
    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        @IBAction func myButtonClicked(_ send: Any) {
            if let data = myTextField.text {
                delegate?.sendData(data: data)
                dismiss(animated: true, completion: nil)
        }
        // Do any additional setup after loading the view.
    }

}
