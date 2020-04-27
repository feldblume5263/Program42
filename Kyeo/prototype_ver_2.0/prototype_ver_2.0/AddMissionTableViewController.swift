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
    override func viewDidLoad()
    {
        super.viewDidLoad()
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
    
    @IBOutlet var imageOption: UIImageView!
    
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageOption.image = selectedImage
            imageOption.contentMode = .scaleAspectFill
            imageOption.clipsToBounds = true
            isDefaultImage = false
        }
        setImageConstraint()
        dismiss(animated: true, completion: nil)
    }
}
