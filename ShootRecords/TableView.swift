//
//  tableView.swift
//  ShootRecords
//
//  Created by kinjo Ryuta on 2016/06/02.
//  Copyright © 2016年 jonny. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class TableView: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    
    @IBOutlet var myTableView: UITableView!
    
    func tableView(myTableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 5
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("myTableView")! as UITableViewCell
        
        cell.textLabel!.text = "Swift"
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
}