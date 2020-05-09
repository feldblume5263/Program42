//
//  LoginViewController.swift
//  from
//
//  Created by user42 on 2020/05/10.
//  Copyright © 2020 Program42. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UINavigationControllerDelegate,UIImagePickerControllerDelegate
{
    let imagePicker = UIImagePickerController()
    @IBOutlet var customImage: UIImageView!
    @IBOutlet var customID: UITextField!
    @IBOutlet var loginButton: UIButton!

    @objc func selectCustomImage()
    {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?)
    {
        self.dismiss(animated: true, completion: nil)
        customImage.image = image
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        print("WHATHAPPENED?")
        if segue.identifier == "toMain"
        {
            let destViewController = segue.destination as! UINavigationController
            let secondViewcontroller = destViewController.viewControllers.first as! MainViewController
            print("loginID: \(customID.text)")
            secondViewcontroller.idStr = customID.text!
            secondViewcontroller.profileImage = customImage.image
        }
    }
        
    @IBAction func loginButtonPressed(sender: UIButton)
    {
        self.performSegue(withIdentifier: "toMain", sender: sender)
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
        {
            if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            {
                customImage.image = selectedImage
            }
            dismiss(animated: true, completion: nil)
        }
        
    override func viewDidLoad()
    {
        super.viewDidLoad()
            customImage.layer.cornerRadius = customImage.frame.width / 2
            customImage.clipsToBounds = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(selectCustomImage))
        customImage.addGestureRecognizer(tap)
        imagePicker.delegate = self
        customImage.isUserInteractionEnabled = true
    }
}
