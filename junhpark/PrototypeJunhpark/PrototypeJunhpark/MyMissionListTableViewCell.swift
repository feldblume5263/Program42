//
//  MyMissionListTableViewCell.swift
//  PrototypeJunhpark
//
//  Created by 박준홍 on 2020/04/28.
//  Copyright © 2020 42Seoul. All rights reserved.
//

import UIKit

class MyMissionListTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
