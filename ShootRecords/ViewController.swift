//
//  ViewController.swift
//  ShootRecords
//
//  Created by kinjo Ryuta on 2016/05/07.
//  Copyright © 2016年 jonny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initImageView()
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

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

