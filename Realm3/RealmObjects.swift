//
//  RealmObjects.swift
//  Realm3
//
//  Created by Bennett Hartrick on 10/22/17.
//  Copyright © 2017 Bennett. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var name: String? = nil
    var age = RealmOptional<Int>()
}

extension User {
    func writeToRealm() {
        try! uiRealm.write {
            uiRealm.add(self)
        }
    }
}
