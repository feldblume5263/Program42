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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellIdentifier = "missionData"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        cell.selectionStyle = .none
        return cell
    }
    
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var userID: UILabel!
    
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
}
