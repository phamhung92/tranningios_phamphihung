//
//  ViewController.swift
//  TranningExe4
//
//  Created by Admin on 7/4/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import CoreData



    var data1 = ["AV2.1","AV2.2","AV2.3","AV2.4","AV2.5","AV2.6","AV2.7"]
    var data2 = ["134","123","323","214","125","326","AV437"]



    class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
       
        var manageObjectContext: NSManagedObjectContext!
        
        override func viewWillAppear(_ animated: Bool) {
            loadDataFromDatabase()
        }
        func loadDataFromDatabase(){
            var appDel : AppDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDel.persistentContainer.viewContext
            
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "AVResult")
            request.returnsObjectsAsFaults = false
            do {
                arrAV.removeAll()
                let result = try context.fetch(request)
                for data in result as! [NSManagedObject] {
                    var av = AVResultModel()
                    av.avValue = data.value(forKey: "avValue") as! Float
                    av.captureDate = data.value(forKey: "captureDate")  as! NSDate
                    av.loviValue = data.value(forKey: "loviValue") as! Int
                    
                    arrAV.append(av)
                }
                tableView.reloadData()
                
            } catch {
                
                print("Failed")
            }
            
        }
        
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data1.count
    }
        
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for:indexPath ) as! TableViewCell
        
        
        // time
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: Date())
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "dd-MMM-yyyy"
        let myStringafd = formatter.string(from: yourDate!)
        
        
        
        cell.lblTime.text = myStringafd
        cell.lblAV.text = data1[indexPath.row]
        cell.lblLoviValue.text = data2[indexPath.row]
        cell.imgright.image = UIImage(named: "icons")
        
        let hang = indexPath.row
        if hang/2==0 {
            
        }
        return cell
    }
        
        
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
        
        
        
   // sửa xoá tableview
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }
    
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
            //delete row
            if editingStyle == .delete{
                data1.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }else if editingStyle == .insert{
                //inset it into the arrylist, and adda new row to the table
            }
        }
        func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
            let plays = data1[sourceIndexPath.row]
            data1.remove(at: sourceIndexPath.row)
            data1.insert(plays, at: destinationIndexPath.row)
       }
        
        func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        
        
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for:indexPath ) as! TableViewCell
            let hang = indexPath.row
            if hang/2==0 {
                /*	let vc1 =
                self.storyboard?.instantiateViewController(withIdentifier: "nagiViewController") as! nagiViewController
                self.navigationController?.pushViewController(navigationController!, animated: true)*/
            }else {
                let vc2 = storyboard?.instantiateViewController(withIdentifier: "presentViewController")
                vc2!.modalPresentationStyle = .fullScreen
                present(vc2!, animated: true, completion: nil)
                
                
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
     
        
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
       


}

