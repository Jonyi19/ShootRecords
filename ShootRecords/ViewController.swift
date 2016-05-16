//
//  ViewController.swift
//  ShootRecords
//
//  Created by kinjo Ryuta on 2016/05/07.
//  Copyright © 2016年 jonny. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet var cort: UIView!
    //shootのdb
    let shoot_db = Shoot()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initImageView()

        //touch画面が出来る
        cort.userInteractionEnabled = true
        cort.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.imageTapped(_:))))
//        cort.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "imageTapped:"))
//        //        Games()
//
//        let me = User()
//        me.name = "たなか"
//        
//        let realm = try! Realm()
//        try! realm.write{
//            realm.add(me)
//        }
//        print(realm.objects(User))
    }
    
    /**
     背景画像をセットする
 UIColorにpatternImageメソッドを使い背景画像を渡して対象となるviewのbackgroundColorにセットするだけ。これで背景画像が表示出来ます。
 */
    
    func initImageView(){
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "coat1.png")?.drawInRect(self.view.bounds)
        
        let image: UIImage! = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
    
    }
    @IBAction func twoPoint(sender: AnyObject) {
         shoot_db.two_point += 1
    }
    @IBAction func noPoint(sender: AnyObject) {
        shoot_db.miss_point += 1
    }

    //画面をタップすると点が入る。
    func imageTapped(sender: UITapGestureRecognizer){
        
        do{
        let realm = try! Realm()
        try! realm.write{
            twoPoint(shoot_db)
            //            shoot_db.two_point += 1
            noPoint(shoot_db)
        }
        
        print("２点です \(shoot_db.two_point)")
            return
        }
        catch{
    
        print("テスト");
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

