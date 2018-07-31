//
//  CollectionViewCell.swift
//  TranningExe06
//
//  Created by Admin on 7/6/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
protocol CollectionViewCellDelegate{
    func tap(index: Int)
}

class CollectionViewCell: UICollectionViewCell {
    
    var delegate: CollectionViewCellDelegate?
    @IBOutlet weak var img: UIImageView!
    var tap: UITapGestureRecognizer!
    var hideImage: UIImage?
    var index: Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        tap = UITapGestureRecognizer(target: self, action: #selector(gestureRecognizer(sender:)))
        addGestureRecognizer(tap)
    }
    
    func setupData(defaultImage: UIImage?,hideImage: UIImage?,isHidden: Bool,index: Int){
        self.index = index
        if isHidden{
            img.image = defaultImage
            self.hideImage = hideImage
        }else{
            img.image = hideImage
            self.hideImage = nil
        }
    }

    func rollImage(){
        guard let hideImage = hideImage else{
            print("img was show")
            return
        }
        UIView.transition(with: img, duration: 0.5, options: UIViewAnimationOptions.transitionFlipFromBottom, animations: {
            self.img.image = hideImage
        }) { (success) in
            self.hideImage = nil
        }
    }
    
    @objc func gestureRecognizer(sender: UIGestureRecognizer!){
        guard let delegate = delegate else{
            print("delegate is nil")
            return
        }
        rollImage()
        delegate.tap(index: index)
    }
}
