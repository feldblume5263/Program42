//
//  MainPageViewController.swift
//  secondPrototype
//
//  Created by 박준홍 on 2020/04/25.
//  Copyright © 2020 42Seoul. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {

    @IBAction func nextPageButtonClick(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "myList") else {return}
        self.present(nextVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
