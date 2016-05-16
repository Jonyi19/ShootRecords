//
//  Games.swift
//  ShootRecords
//
//  Created by kinjo Ryuta on 2016/05/11.
//  Copyright © 2016年 jonny. All rights reserved.
//
import UIKit
import Foundation
import RealmSwift

/*
 touchされたら２ポイントのカウントされる。
 がしたい
 
 */

class Games: UIViewController {
    
    let shoot_db = Shoot()
    
    override func touchesBegan(touches: Set<UITouch>,withEvent event: UIEvent?){
  //      let touch = touches.first
        
        //for touch: AnyObject in touches{
        
    shoot_db.two_point += 1
    
    print(shoot_db.two_point)
    print("games")
    }

}