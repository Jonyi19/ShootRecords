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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var items = ["aaa","bbb","ccc"]
    let cells = "MyCell"
    
    
    @IBOutlet var myTableView: UITableView!
    
    //データの総数を返す
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    /**
     *  指定した行のデータを返す
     */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default,reuseIdentifier: cells)
        cell.textLabel?.text = items[indexPath.row]
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
        
        let str = items[self.tableView.indexPathForSelectedRow!.row]
        let vc = segue.destinationViewController as! ViewController
        }
        
        
    }
    /**
     クリック後に日付を挿入する
     
     - parameter sender: <#sender description#>
     */
    @IBAction func clickAdd(sender: AnyObject) {
        let dt = NSDate()
        let fmt = NSDateFormatter()
        fmt.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let str = fmt.stringFromDate(dt)
        items.insert(str, atIndex: 0)
        let indexPath = NSIndexPath(forItem: 0,inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
        items.removeAtIndex(items.count)
    tableView.reloadData()
    }
    }


    
}