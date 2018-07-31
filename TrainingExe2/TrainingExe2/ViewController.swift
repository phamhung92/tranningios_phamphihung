//
//  ViewController.swift
//  TrainingExe2
//
//  Created by Admin on 7/3/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var hoTextfield: UITextField!
    @IBOutlet weak var tenTextField: UITextField!
    @IBOutlet weak var hokanaTextField: UITextField!
    @IBOutlet weak var tenKanaTextField: UITextField!
    @IBOutlet weak var emaiTextField: UITextField!
    @IBOutlet weak var sdtTextField: UITextField!
    @IBAction func dkButton(_ sender: Any) {
       
        if hoTextfield.text! == "" || tenTextField.text! == "" ||  tenKanaTextField.text! == "" || sdtTextField.text! == ""
         {
            showaler(str: "khong duoc de trong")
        }else{
            if isValidEmail(testStr: emaiTextField.text!){
                showaler(str: "thanh cong")
            }else {
                showaler(str: "khong dung dinh dang")
            }
        }
            
        
    }
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: testStr)
        
    }
    
    func showaler(str:String) {
        let alertController = UIAlertController(title: "thông báo", message: str, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        <#code#>
    }
    //tex
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

