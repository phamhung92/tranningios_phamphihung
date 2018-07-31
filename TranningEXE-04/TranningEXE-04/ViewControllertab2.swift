//
//  ViewController2.swift
//  TranningEXE-04
//
//  Created by Admin on 7/10/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewControllertab2: UIViewController,DataDelegate{
    func sendData(text: String, text1: String, text2: String, images: UIImageView) {
        lblTime2.text = text
        lblAV2.text = text1
        lblInt.text = text2
        img2=images
    }
    
    
    
    
  
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    

    @IBOutlet weak var lblInt: UILabel!
    @IBOutlet weak var lblAV2: UILabel!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var lblTime2: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

   

}
