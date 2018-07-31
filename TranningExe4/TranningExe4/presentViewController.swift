//
//  presentViewController.swift
//  TranningExe4
//
//  Created by Admin on 7/5/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import CoreData

class presentViewController: UIViewController {

    @IBOutlet weak var lblaAV: UILabel!
    @IBOutlet weak var lblTIME: UILabel!
    @IBOutlet weak var lblInt: UILabel!
    var dataupdate = NSManagedObject()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    
    if (dataupdate != nil)
    {
        lblaAV.text = dataupdate.value(forKey: "player_AV")as? String
        lblTIME.text = dataupdate.value(forKey: "player_TIME")as? String
        lblInt.text = dataupdate.value(forKey: "player_int")as? String
   
    
    }
}



override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}


@IBAction func save_update(_ sender: Any)
{
    let app = UIApplication.shared.delegate as! AppDelegate
    
    let context = app.persistentContainer.viewContext as! NSManagedObjectContext
    
    if (dataupdate != nil)
    {
        dataupdate.setValue(self.lblaAV.text, forKey: "player_AV")
        dataupdate.setValue(self.lblTIME.text, forKey: "player_TIME")
        dataupdate.setValue(self.lblInt.text, forKey: "player_int")
        
        
        
        
    }
        
    else
    {
        
        let newplayer = NSEntityDescription.insertNewObject(forEntityName: "PlayerDetails", into: context)
        
        newplayer.setValue(self.txt_playername.text, forKey: "player_name")
        
        newplayer.setValue(self.txt_playerid.text, forKey: "player_id")
        
        newplayer.setValue(self.txt_playerteam.text, forKey: "player_team")
        
        
        
        
    }
    
    do
    {
        try context.save()
    }
    catch let error as NSError
    {
        print(error.localizedDescription)
    }
    
    
    self.dismiss(animated: true, completion: nil)
    
}

   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
