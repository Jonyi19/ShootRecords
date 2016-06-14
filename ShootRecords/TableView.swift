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

class tableView: UITableViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.title = self.title! + ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    let item = ["aaa","bbb","ccc"]
    let cellID = "MyCell"
    
    
    @IBOutlet var myTableView: UITableView!
    
    //データの総数を返す
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    /**
     *  指定した行のデータを返す
     */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default,reuseIdentifier: cellID)
        cell.textLabel?.text = item[indexPath.row]
        return cell
    }
    /**
     セルを選択する
     
     - parameter tableView: <#tableView description#>
     - parameter indexPath: <#indexPath description#>
     */
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("segueDetail", sender: self)
    }
    /**
     *  詳細ベージを開いた時に値を受け渡す
     */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueDetail" {
        
        let str = item[self.tableView.indexPathForSelectedRow!.row]
        let vc = segue.destinationViewController as! ViewController
        }
        
        
    }
    
    

    
}