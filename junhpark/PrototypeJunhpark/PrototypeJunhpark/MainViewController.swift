//
//  MainViewController.swift
//  PrototypeJunhpark
//
//  Created by 박준홍 on 2020/04/27.
//  Copyright © 2020 42Seoul. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
   
    var data: [Int] = []
       @IBOutlet var mainTable: UITableView?
       @IBOutlet var projectName: UILabel!
       @IBOutlet var timeData: UILabel!
       @IBOutlet var locationData: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

