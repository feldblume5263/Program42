//
//  AddMissionTableViewController.swift
//  prototype_ver_2.0
//
//  Created by user42 on 2020/04/27.
//  Copyright © 2020 Program42. All rights reserved.
//

import UIKit

class AddMissionTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet var timeData: UIDatePicker!
    @IBOutlet var imageOption: UIImageView!
    @IBOutlet var mondayButton: UIButton!
    @IBOutlet var tuesdayButton: UIButton!
    @IBOutlet var wednesdayButton: UIButton!
    @IBOutlet var thursdayButton: UIButton!
    @IBOutlet var fridayButton: UIButton!
    @IBOutlet var saturdayButton: UIButton!
    @IBOutlet var sundayButton: UIButton!
    @IBOutlet var missionName: UITextField!
    @IBOutlet var missionTime: UIDatePicker!
    
    func setButtonShape()
    {
        mondayButton.layer.cornerRadius = mondayButton.bounds.width / 2
        mondayButton.clipsToBounds = true
        tuesdayButton.layer.cornerRadius = mondayButton.bounds.width / 2
        tuesdayButton.clipsToBounds = true
        wednesdayButton.layer.cornerRadius = mondayButton.bounds.width / 2
        wednesdayButton.clipsToBounds = true
        thursdayButton.layer.cornerRadius = mondayButton.bounds.width / 2
        thursdayButton.clipsToBounds = true
        fridayButton.layer.cornerRadius = mondayButton.bounds.width / 2
        fridayButton.clipsToBounds = true
        saturdayButton.layer.cornerRadius = mondayButton.bounds.width / 2
        saturdayButton.clipsToBounds = true
        sundayButton.layer.cornerRadius = mondayButton.bounds.width / 2
        sundayButton.clipsToBounds = true
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setButtonShape()
    }
    
    var isDefaultImage = false
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if indexPath.row == 0
        {
            let photoSource = UIAlertController(title: "", message: "미션 사진 추가", preferredStyle: .actionSheet)
            let photoLibraryAction = UIAlertAction(title: "사진 선택", style: .default, handler: {(action) in
                if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                    let imagePicker = UIImagePickerController()
                    imagePicker.allowsEditing = false
                    imagePicker.sourceType = .photoLibrary
                    imagePicker.delegate = self
                    self.present(imagePicker, animated: true, completion: nil)
                }
            })
            let defaultImageAction = UIAlertAction(title: "기본 사진으로 설정", style: .default, handler: {(action) in
                self.isDefaultImage = true
                self.imageOption.image = UIImage(named: "defaultImage")
                self.imageOption.contentMode = .scaleAspectFill
                self.imageOption.clipsToBounds = true
                self.setImageConstraint()
            })
            photoSource.addAction(defaultImageAction)
            photoSource.addAction(photoLibraryAction)
            present(photoSource,animated: true, completion: nil)
        }
    }
    
    func setImageConstraint()
    {
        let leadingConstraint = NSLayoutConstraint(item: imageOption as Any, attribute: .leading, relatedBy: .equal, toItem: imageOption.superview, attribute: .leading, multiplier: 1, constant: 0)
        leadingConstraint.isActive = true

        let trailingConstraint = NSLayoutConstraint(item: imageOption as Any, attribute: .trailing, relatedBy: .equal, toItem: imageOption.superview, attribute: .trailing, multiplier: 1, constant: 0)
        trailingConstraint.isActive = true

        let topConstraint = NSLayoutConstraint(item: imageOption as Any, attribute: .top, relatedBy: .equal, toItem: imageOption.superview, attribute: .top, multiplier: 1, constant: 0)
        topConstraint.isActive = true

        let bottomConstraint = NSLayoutConstraint(item: imageOption as Any, attribute: .bottom, relatedBy: .equal, toItem: imageOption.superview, attribute: .bottom, multiplier: 1, constant: 0)
        bottomConstraint.isActive = true
    }
    var imageData: UIImageView?
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageOption.image = selectedImage
            
            imageData!.image = selectedImage
            
            imageOption.contentMode = .scaleAspectFill
            imageOption.clipsToBounds = true
            isDefaultImage = false
        }
        setImageConstraint()
        dismiss(animated: true, completion: nil)
    }

    var dayButtonData = Array(repeating: 0, count: 7)
    var index = 0
    @IBAction func tapDayButton(sender: UIButton)
    {
        switch sender.restorationIdentifier
        {
        case "tuesday":
            index = 1
        case "wednesday":
            index = 2
        case "thursday":
            index = 3
        case "friday":
            index = 4
        case "saturday":
            index = 5
        case "sunday":
            index = 6
        default:
            index = 0
        }
        print("\(dayButtonData)")
        if dayButtonData[index] == 0
        {
            dayButtonData[index] = 1
            sender.setTitleColor(.darkGray, for: .normal)
            sender.backgroundColor = UIColor(red: 0.361, green: 0.788, blue: 0.812, alpha: 1.0)
        }
        else if dayButtonData[index] == 1
        {
            dayButtonData[index] = 0
            sender.setTitleColor(.systemGray, for: .normal)
            sender.backgroundColor = .systemGray6
        }
    }
}
