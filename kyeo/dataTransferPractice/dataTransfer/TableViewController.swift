//
//  TableViewController.swift
//  dataTransfer
//
//  Created by user42 on 2020/04/30.
//  Copyright © 2020 Program42. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var data: [String] = []
    var newData = ""

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "dataCell"
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
        
        cell.dataLabel.text = data[indexPath.row]
        print("CELL: \(data[indexPath.row])")
        return cell
    }
    
    @IBAction func cancel(segue: UIStoryboardSegue)
    {
        
    }
    @IBAction func done(segue: UIStoryboardSegue)
    {
        let vc = segue.source as! ViewController
        newData = vc.sendData
        print(newData)
        data.append(newData)
        tableView.reloadData()
    }
}
