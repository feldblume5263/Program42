//
//  MainViewController.swift
//  prototype_ver_2.0
//
//  Created by user42 on 2020/04/27.
//  Copyright © 2020 Program42. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    var missionData: [String] = []
    var nameData = ""
    var timeData = ""
    @IBOutlet var mainTableView: UITableView!
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var userID: UILabel!

    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return missionData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellIdentifier = "missionData"
        let cell: MainTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MainTableViewCell

        cell.selectionStyle = .none
        cell.missionName.text = missionData[indexPath.row]
        let addMissionVC = AddMissionTableViewController()
        if addMissionVC.imageData?.image != nil
        {
        cell.missionImage.image = addMissionVC.imageData!.image
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
    
    @IBAction func addButtonPressed(segue: UIStoryboardSegue)
    {
        if segue.identifier == "addButton"
        {
            let mainVC = segue.source as! AddMissionTableViewController
            nameData = mainVC.missionName.text!
            missionData.append(nameData)
            mainTableView.reloadData()
        }
    }
}
