//
//  MainViewController.swift
//  PrototypeKyeo
//
//  Created by user42 on 2020/04/23.
//  Copyright © 2020 Program42. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var data: [Int] = []
    @IBOutlet var mainTable: UITableView?
    @IBOutlet var projectName: UILabel!
    @IBOutlet var timeData: UILabel!
    @IBOutlet var locationData: UILabel!
    var i = 0;
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        return cell
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}
