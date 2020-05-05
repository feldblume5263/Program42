//
//  MainViewController.swift
//  prototype_ver_2.0
//
//  Created by user42 on 2020/04/27.
//  Copyright © 2020 Program42. All rights reserved.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    var missionData: [String] = []
    var nameData = ""
    var timeData = ""
    var dayData: [Int] = []
    var gpsData: [CLLocation] = []
    @IBOutlet var mainTableView: UITableView!
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var userID: UILabel!

    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return missionData.count
    }
    
    var dayString = ""
    let dayHangul = ["월", "화", "수", "목", "금", "토", "일"]
    func getDayString()
    {
        dayString = ""
        var i = 0;
        
        while i < 7
        {
            if dayData[i] == 1
            {
                dayString.append(dayHangul[i])
                if i != 6
                {
                    dayString.append(" ")
                }
            }
            i += 1
        }
        i = 0
        while i < 7
        {
            if dayData[i] != 1
            {
                break
            }
            i += 1
        }
        if i == 5
        {
            dayString = "주중"
        }
        else if i == 7
        {
            dayString = "매일"
        }
        else
        {
            i = 0
            while i < 7
            {
                if dayData[i] != 0
                {
                    break
                }
                i += 1
            }
            if i == 5
            {
                dayString = "주말"
            }
        }
        print(dayString)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellIdentifier = "missionData"
        let cell: MainTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MainTableViewCell

        cell.selectionStyle = .none
        cell.missionName.text = "미션이름: " + missionData[indexPath.row]
        cell.missionTime.text = timeArray[indexPath.row] + ", \(dayArray[indexPath.row])"
        cell.missionImage.image = imageArray[indexPath.row]
        return cell
    }
    
    @objc func goAddMissionView(sender: UIBarButtonItem)
    {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addMissionView = storyBoard.instantiateViewController(withIdentifier: "addMissionView") as! AddMissionTableViewController
        self.navigationController?.pushViewController(addMissionView, animated: true)
        //self.present(addMissionView, animated: true, completion: nil)
    }
    
    func setAddMissionButton()
    {
        let addButton = UIBarButtonItem(image: UIImage(named: "addButton")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(goAddMissionView(sender:)))

        navigationItem.rightBarButtonItem = addButton
    }
    
    func setUserInfo()
    {
        userImage.layer.cornerRadius = userImage.frame.width / 2
        userImage.clipsToBounds = true
        userID!.text = "리눅스 토르발즈"
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setAddMissionButton()
        setUserInfo()
    }
    var dayArray: [String] = []
    var timeArray: [String] = []
    var imageArray: [UIImage] = []
    var locationData: CLLocation!
    @IBAction func addButtonPressed(segue: UIStoryboardSegue)
    {
        if segue.identifier == "addButton"
        {
            let addMissionVC = segue.source as! AddMissionTableViewController
            nameData = addMissionVC.missionName.text!
            let dateForm = DateFormatter()
            dateForm.dateFormat = "인증시간: h:mm aa"
            timeData = dateForm.string(from: addMissionVC.timeOption!.date)
            dayData = addMissionVC.dayButtonData
            getDayString()
            imageArray.append(addMissionVC.imageData!)
            dayArray.append(dayString)
            timeArray.append(timeData)
            missionData.append(nameData)
            locationData = addMissionVC.locationAMTV
            print("TTTTESTS: \(locationData.coordinate.latitude) \(locationData.coordinate.longitude)")
            gpsData.append(locationData)
            mainTableView.reloadData()
        }
    }
}
