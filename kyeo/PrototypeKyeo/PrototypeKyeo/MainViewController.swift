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
    var numberOfData: [Int] = []
    @IBOutlet var mainTable: UITableView?
    @IBOutlet var projectName: UILabel!
    @IBOutlet var timeData: UILabel!
    @IBOutlet var locationData: UILabel!
    var i = 0;
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        return cell
    }
    
    @IBAction func addButtonPressed(sender: UIBarButtonItem)
    {
        var i = 0
        let addDataVC = AddDataTableViewController()

        while (i < 7)
        {
            if addDataVC.isButtonPressed[i] == 1
            {
                numberOfData.append(1)
            }
            i += 1
        }
        mainTable?.insertRows(at: [IndexPath(row: 0, section: 0)], with: .top)
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("GIT TEST!")
    }
}
