//
//  ViewController.swift
//  Realm3
//
//  Created by Bennett Hartrick on 10/22/17.
//  Copyright © 2017 Bennett. All rights reserved.
//

import UIKit
import Firebase
import RealmSwift

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        grabData()
    }
    
    func grabData() {
        var databaseRef = Database.database().reference()
        databaseRef.child("users").observe(.value) { (snapshot) in
            
            print(snapshot)
            
            for snap in snapshot.children.allObjects as! [DataSnapshot] {
                guard let dictionary = snap.value as? [String: AnyObject] else {
                    return
                }
                var name = dictionary["Name"] as? String
                var age = dictionary["Age"] as? Int
                
                var UserToAdd = User()
                UserToAdd.name = name
                UserToAdd.age.value = age
                UserToAdd.writeToRealm()
            }
        }
    }
    
}

