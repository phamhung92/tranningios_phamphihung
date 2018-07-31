//
//  CollectionViewCellSwipe.swift
//  TranningExe06
//
//  Created by Admin on 7/9/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class CollectionViewCellSwipe: UICollectionViewCell {
    
    var index = 0
    var hideImage: UIImage?
    var delegate: CollectionViewCellDelegate?
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandle))
        swipe.direction = .right
        addGestureRecognizer(swipe)
    }
    
    class func identifier()->String{
        return "CollectionViewCellSwipe"
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
    
    @objc func swipeHandle(){
        guard let delegate = delegate else{
            print("delegate is nil")
            return
        }
        rollImage()
        delegate.tap(index: index)
    }
}
