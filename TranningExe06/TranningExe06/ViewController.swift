//
//  ViewController.swift
//  TranningExe06
//
//  Created by Admin on 7/6/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var collection : UICollectionView!
    var images:[String] = ["download","download-1","download-2","download-3","download-4","download-5","download-6","download-7","download-8","download-9","download-10","download-11"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collection.register(UINib(nibName: CollectionViewCellSwipe.identifier(), bundle: nil), forCellWithReuseIdentifier: CollectionViewCellSwipe.identifier())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item % 2 == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellSwipe.identifier(), for: indexPath) as! CollectionViewCellSwipe
            let image = UIImage(named: images[indexPath.row])
            let defaultImg = UIImage(named: "download")
            cell.setupData(defaultImage: defaultImg, hideImage: image, isHidden: true, index: indexPath.item)
            cell.delegate = self
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let image = UIImage(named: images[indexPath.row])
        let defaultImg = UIImage(named: "download")
        cell.setupData(defaultImage: defaultImg, hideImage: image, isHidden: true, index: indexPath.item)
        cell.delegate = self
        return cell
    }
}

extension ViewController: CollectionViewCellDelegate{

    func tap(index: Int) {
        print("tap")
    }
    
    func swipe() {
        print("swipe")
    }
}
