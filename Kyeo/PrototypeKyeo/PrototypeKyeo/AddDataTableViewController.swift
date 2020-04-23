//
//  AddDataTableViewController.swift
//  PrototypeKyeo
//
//  Created by user42 on 2020/04/23.
//  Copyright © 2020 Program42. All rights reserved.
//

import UIKit

class AddDataTableViewController: UITableViewController {
    @IBOutlet var timeData: UITextField!
    var datePicker: UIDatePicker?

    func createDatePicker()
    {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolBar.setItems([doneButton], animated: true) 
        timeData.inputAccessoryView = toolBar
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .time
        timeData.inputView = datePicker
    }
    
    @objc func donePressed()
    {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        timeData.text = formatter.string(from: datePicker!.date)
        self.view.endEditing(true)
    }
    
    @IBOutlet var mondayButton: UIButton!
    @IBOutlet var tuesdayButton: UIButton!
    @IBOutlet var wednesdayButton: UIButton!
    @IBOutlet var thursdayButton: UIButton!
    @IBOutlet var fridayButton: UIButton!
    @IBOutlet var saturdayButton: UIButton!
    @IBOutlet var sundayButton: UIButton!
    var isButtonPressed = [0, 0, 0, 0, 0, 0, 0]
    var index = 0
    @objc func tapDayButton(sender: UIButton)
    {
        print("ButtonTapped\(isButtonPressed)")
        print("\(sender.restorationIdentifier!)")

        if sender.restorationIdentifier == "sunday"
        {
            index = 0
        }
        else if sender.restorationIdentifier == "monday"
        {
            index = 1
        }
        else if sender.restorationIdentifier == "tuesday"
        {
            index = 2
        }
        else if sender.restorationIdentifier == "wednesday"
        {
            index = 3
        }
        else if sender.restorationIdentifier == "thursday"
        {
            index = 4
        }
        else if sender.restorationIdentifier == "friday"
        {
            index = 5
        }
        else if sender.restorationIdentifier == "saturday"
        {
            index = 6
        }
        if isButtonPressed[index] == 0
        {
            sender.setBackgroundImage(UIImage(named: "bCircle"), for: .normal)
            sender.setTitleColor(.white, for: .normal)
            isButtonPressed[index] = 1
        }
        else if isButtonPressed[index] == 1
        {
            sender.setBackgroundImage(UIImage(named: "wCircle"), for: .normal)
            sender.setTitleColor(.black, for: .normal)
            isButtonPressed[index] = 0
        }
    }
    @IBAction func setButton(sender: UIButton)
    {
        if sender.restorationIdentifier! == "monday"
        {
            mondayButton.addTarget(self, action: #selector(self.tapDayButton), for: .touchUpInside)
        }
        else if sender.restorationIdentifier! == "tuesday"
        {
            tuesdayButton.addTarget(self, action: #selector(self.tapDayButton), for: .touchUpInside)
        }
        else if sender.restorationIdentifier! == "wednesday"
        {
            wednesdayButton.addTarget(self, action: #selector(self.tapDayButton), for: .touchUpInside)
        }
        else if sender.restorationIdentifier! == "thursday"
        {
            thursdayButton.addTarget(self, action: #selector(self.tapDayButton), for: .touchUpInside)
        }
        else if sender.restorationIdentifier! == "friday"
        {
            fridayButton.addTarget(self, action: #selector(self.tapDayButton), for: .touchUpInside)
        }
        else if sender.restorationIdentifier! == "saturday"
        {
            saturdayButton.addTarget(self, action: #selector(self.tapDayButton), for: .touchUpInside)
        }
        else if sender.restorationIdentifier! == "sunday"
        {
            sundayButton.addTarget(self, action: #selector(self.tapDayButton), for: .touchUpInside)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
}
