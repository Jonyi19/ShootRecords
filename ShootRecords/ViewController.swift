//
//  ViewController.swift
//  ShootRecords
//
//  Created by kinjo Ryuta on 2016/05/07.
//  Copyright © 2016年 jonny. All rights reserved.
//

import UIKit
import RealmSwift


class ViewController: UIViewController{
    
    @IBOutlet var cort: UIView!
    //shootのdb
    
    //private var myRightButton: UIBarButtonItem!
    let shoot_db = Shoot()
    override func viewDidLoad() {
        super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
        initImageView()
        
        //touch画面が出来る
        cort.userInteractionEnabled = true
        cort.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.imageTapped(_:))))
        
    }
    
    /**
     背景画像をセットする
     UIColorにpatternImageメソッドを使い背景画像を渡して対象となるviewのbackgroundColorにセットするだけ。これで背景画像が表示出来ます。
     - returns: 画像を返す
     */
    func initImageView(){
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "coat1.png")?.drawInRect(self.view.bounds)
        
        let image: UIImage! = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        
        
    }
    
    @IBOutlet weak var twoView: UILabel!
    @IBOutlet weak var noView: UILabel!
    
    //０点ボタンの動き
    @IBAction func noBtn(sender: AnyObject) {
        print("０点ボタンが押されました")
        upDateNoCount()
    }
    
    //２点ボタンの動き
    @IBAction func twoBtn(sender: AnyObject) {
        print("２点ボタンが押されました")
        upDateTwoCount()
    }
    var shoot = 2
    
    //Label２点の切り替え
    func upDateTwoCount(){
        shoot = 2
        twoShoot()
        let str = String(shoot_db.two_point)
        self.twoView.text = str
        return
    }
    
    //Label０点の切り替え
    func upDateNoCount(){
        shoot = 0
        noShoot()
        let str1 = String(shoot_db.miss_point)
        self.noView.text = str1
        return
    }
    
    /**
     2点のカウント
     */
    func twoShoot(){
        let realm = try! Realm()
        try! realm.write{
            shoot_db.two_point += 1
        }
        
        print("２点です \(shoot_db.two_point)")
    }
    
    //０点のカウント
    func noShoot(){
        let realm = try! Realm()
        try! realm.write{
            shoot_db.miss_point += 1
        }
        
        print("0点です \(shoot_db.miss_point)")
    }
    
    
    //画面をタップすると点が入る。
    func imageTapped(sender: UITapGestureRecognizer){
        
        if shoot == 2 {
            self.upDateTwoCount()
        }else if shoot == 0{
            self.upDateNoCount()
        }
        return
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

