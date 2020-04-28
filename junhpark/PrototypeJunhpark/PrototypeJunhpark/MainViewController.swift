//
//  MainViewController.swift
//  PrototypeJunhpark
//
//  Created by 박준홍 on 2020/04/27.
//  Copyright © 2020 42Seoul. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var userID = "JonyIve"
    var missionName = ["study", "yoga", "running"]
    var missionThumbnail = ["study", "yoga", "running"]
    var missionDay = ["study" : "Mon, Tue, Wed, Thu, Fri", "yoga" : "Wed, Fri", "running" : "Sat, Sun" ]
    var missionTime = ["study" : "11:00", "yoga" : "18:00", "running" : "09:00"]
    
    var userThumbnailImage: UIImage?
    
    @IBOutlet var userIDLabel: UILabel!
    @IBOutlet var userThumbnailImageview: UIImageView!
    @IBOutlet var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.delegate = self
        tableView?.dataSource = self
        userIDLabel.text = userID
        userThumbnailImageview.layer.cornerRadius = userThumbnailImageview.frame.width / 2
        userThumbnailImage = UIImage(named: userID)
        userThumbnailImageview.image = userThumbnailImage
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "missionList", for: indexPath) as! MyMissionListTableViewCell
        cell.nameLabel.text = missionName[indexPath.row]
        cell.dayLabel.text = missionDay[missionName[indexPath.row]]
        cell.timeLabel.text = missionTime[missionName[indexPath.row]]
        cell.thumbnailImageView.image = UIImage(named: missionThumbnail[indexPath.row])

        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return missionName.count
    }
    
    
    
}

