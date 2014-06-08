//
//  MyTableViewCell.swift
//  checkList
//
//  Created by zhaolei on 14-6-8.
//  Copyright (c) 2014年 flyingzl. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: UITableViewCellStyle.Subtitle, reuseIdentifier: reuseIdentifier)
        
        self.textColor = UIColor.blueColor()
    
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }

}
