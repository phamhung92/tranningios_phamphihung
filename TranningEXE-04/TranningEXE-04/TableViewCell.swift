//
//  TableViewCell.swift
//  TranningEXE-04
//
//  Created by Admin on 7/10/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

protocol DataDelegate {
    func sendData(text: String,text1 :String,text2 :String,images :UIImageView)
    }


class TableViewCell: UITableViewCell {
   
    var delegate : DataDelegate?
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblint: UILabel!
    @IBOutlet weak var lblAv: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        delegate?.sendData(text: lblTime.text!, text1: lblAv.text!, text2: lblint.text!, images: img)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
