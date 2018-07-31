//
//  ViewController2.swift
//  TranningExe4
//
//  Created by Admin on 7/5/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit



class ViewController2: UIViewController ,UITableViewDelegate, UITableViewDataSource{
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
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    

    @IBAction func btbDone(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

   
}
