//
//  ViewController.swift
//  testfile
//
//  Created by 박준홍 on 2020/05/04.
//  Copyright © 2020 42Seoul. All rights reserved.
//

import UIKit

class ReceiveViewController: UIViewController, SendDataDelegate {

    @IBOutlet weak var myLabel: UILabel!
    func sendData(data: String) {
        myLabel.text = data?
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

