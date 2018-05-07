//
//  King.swift
//  TWGOT
//
//  Created by mac on 06/05/18.
//  Copyright © 2018 Adithya. All rights reserved.
//

import Foundation

class King {
    var name : String = ""
    var ratingScore : Double = 400
    var attacks : Int = 0
    var defends : Int = 0
    var victories : Int = 0
    var battlesList : [Battle] = [Battle]()
    var sigilImage : String?
    
    init(withName nameString:String) {
        name = nameString
    }
    
}

