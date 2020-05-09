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
    let cal = Calendar(identifier: .gregorian)
    let now = Date()
    
    var missionData: [String] = []
    var nameData = ""
    var timeData = ""
    var timeSource: [Int] = []
    var dayData: [Int] = []
    var daySource: [Int] = []
    var gpsData: [CLLocation] = []
    @IBOutlet var mainTableView: UITableView!
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var userID: UILabel!
    @IBOutlet var userPercentage: UILabel!
    
    var allCount: Double = 0.000001
    var completedMissionCount: Int! = 0
    
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
        var j = 0;
        
        while j < 7
        {
            if dayData[j] == 1 {
                allCount += 1
            }
            j += 1
        }
        completeData()
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
        let dayOfWeek = cal.component(.weekday, from: now)
        let cellIdentifier = "missionData"
        let cell: MainTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MainTableViewCell
        
        cell.completeButton.tag = indexPath.row
        
        cell.selectionStyle = .none
        cell.completeButton.layer.cornerRadius = 5.0
        cell.missionName.text = missionData[indexPath.row]
        cell.missionDay.text = dayArray[indexPath.row]
        cell.missionTime.text = timeArray[indexPath.row]
        cell.missionImage.image = imageArray[indexPath.row]
        
        if dayOfWeek == 1 {
            if (daySource[indexPath.row * 7 + 6] == 1) {
                cell.completeButton.isEnabled = true
            }
            else {
                cell.completeButton.isEnabled = false
                cell.completeButton.backgroundColor = .systemGray6
                cell.completeButton.setTitleColor(.systemGray, for: .normal)
            }
        }
        if dayOfWeek == 2 {
            if (daySource[indexPath.row * 7] == 1) {
                cell.completeButton.isEnabled = true
            }
            else {
                cell.completeButton.isEnabled = false
                cell.completeButton.backgroundColor = .systemGray6
                cell.completeButton.setTitleColor(.systemGray, for: .normal)
            }
        }
        if dayOfWeek == 3 {
            if (daySource[indexPath.row * 7 + 1] == 1) {
                cell.completeButton.isEnabled = true
            }
            else {
                cell.completeButton.isEnabled = false
                cell.completeButton.backgroundColor = .systemGray6
                cell.completeButton.setTitleColor(.systemGray, for: .normal)
            }
        }
        if dayOfWeek == 4 {
            if (daySource[indexPath.row * 7 + 2] == 1) {
                cell.completeButton.isEnabled = true
            }
            else {
                cell.completeButton.isEnabled = false
                cell.completeButton.backgroundColor = .systemGray6
                cell.completeButton.setTitleColor(.systemGray, for: .normal)
            }
        }
        if dayOfWeek == 5 {
            if (daySource[indexPath.row * 7 + 3] == 1) {
                cell.completeButton.isEnabled = true
            }
            else {
                cell.completeButton.isEnabled = false
                cell.completeButton.backgroundColor = .systemGray6
                cell.completeButton.setTitleColor(.systemGray, for: .normal)
            }
        }
        if dayOfWeek == 6 {
            if (daySource[indexPath.row * 7 + 4] == 1) {
                cell.completeButton.isEnabled = true
            }
            else {
                cell.completeButton.isEnabled = false
                cell.completeButton.backgroundColor = .systemGray6
                cell.completeButton.setTitleColor(.systemGray, for: .normal)
            }
        }
        if dayOfWeek == 7 {
            if (daySource[indexPath.row * 7 + 5] == 1) {
                cell.completeButton.isEnabled = true
            }
            else {
                cell.completeButton.isEnabled = false
                cell.completeButton.backgroundColor = .systemGray6
                cell.completeButton.setTitleColor(.systemGray, for: .normal)
            }
        }
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
        //let addButton = UIBarButtonItem(image: UIImage(named: "addButton")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(goAddMissionView(sender:)))
        let addButton = UIBarButtonItem(title: "새 미션 추가", style: .plain, target: self, action: #selector(goAddMissionView(sender:)))
        addButton.tintColor = UIColor(red: 0.317, green: 0.651, blue: 0.605, alpha: 1.0)
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
        completeData()
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
            dateForm.dateFormat = "h:mm aa"
            timeData = dateForm.string(from: addMissionVC.timeOption!.date)
            dayData = addMissionVC.dayButtonData
            daySource.append(contentsOf: dayData)
            print(daySource)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "toCompleteView"
        {
            let dest = segue.destination
            
            guard let cvc = dest as? CompleteViewController else
            {
                return
            }
            let index = (sender as! UIButton).tag
            cvc.destLocation = gpsData[index]
        }
    }
    
    func completeData() {
        print("value =  \(completedMissionCount!)")
        print(dayData)
        print(allCount)
        let percentage: Double = round((Double((Double(completedMissionCount) / Double(allCount)) * 100)) * 10) / 10
        userPercentage.text! = "주간 미션달성률 : \(percentage)%"
    }
    
    @IBAction func pressCompleteButton(sender: UIButton)
    {
        self.performSegue(withIdentifier: "toCompleteView", sender: sender)
    }
    
    @IBAction func countComplete(segue: UIStoryboardSegue) {
        let completeMissionVC = segue.source as! CompleteViewController
        completedMissionCount += completeMissionVC.countComplete
        completeData()
    }
    
    
}
