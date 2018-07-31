//
//  TableViewCell.swift
//  TranningExe4
//
//  Created by Admin on 7/4/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var imgleft: UIImageView!
    
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblLoviValue: UILabel!
    
    @IBOutlet weak var imgright: UIImageView!
    @IBOutlet weak var lblAV: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
      
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
