//
//  ViewController.swift
//  TranningEXE-04
//
//  Created by Admin on 7/10/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import CoreData




class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    
    
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    var delegate : DataDelegate?
    
    var data = ["AV1","AV2","AV3","AV4","AV5","AV5","AV5" ]
    var data1 = ["134","123","323","214","125","326","437"]
    var arrAV = [ARVsuf]()
    
    
    func getContext() ->NSManagedObjectContext{
        let CoreData = UIApplication.shared.delegate as! AppDelegate
        return CoreData.persistentContainer.viewContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
    }
    
    
    
   
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        
        if let av = data[Selector] {
            cell.lblAv.text = "\(av)"
        }
        //time
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: Date())
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "dd-MMM-yyyy"
        let myStringafd = formatter.string(from: yourDate!)
        
        
        
        cell.lblTime.text = myStringafd
        
        cell.lblint.text = data1[indexPath.row]
        cell.img.image = UIImage(named: "icons")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }else {
            editingStyle == .insert
        }
        
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let plays = data[sourceIndexPath.row]
        data.remove(at: sourceIndexPath.row)
        data.insert(plays, at: destinationIndexPath.row)
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row/2==0{
            
        }else {
            let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllertab2")
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            vc2?.modalPresentationStyle = .fullScreen
            delegate?.sendData(text: cell.lblTime.text!, text1: cell.lblAv.text!, text2: cell.lblint.text!, images: cell.img)
            present(vc2!, animated: true, completion: nil)
            
        }
    }
    
    
    
   
    

   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func storeContact( contactName : String){
        let constext = getContext()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ARV")
        
        
        request.returnsObjectsAsFaults = false
        do {
            data.removeAll()
            let result = try constext.fetch(request)
            for data in result as! [NSManagedObject] {
                let av = ARVsuf()
                
                av.av = data.value(forKey: "avresurf") as! Float
                
                arrAV.append(av)
            }
            tableView.reloadData()
            
        } catch {
            
            print("Failed")
        }
    }


}

