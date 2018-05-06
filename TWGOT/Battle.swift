//
//  Battle.swift
//  TWGOT
//
//  Created by mac on 06/05/18.
//  Copyright © 2018 Adithya. All rights reserved.
//

import Foundation

struct Battle {
    var name : String
    var number : Int
    var year : Int?
    var attackerKing : String
    var defenderKing : String
    var attackerOutcome : String

    init(withDetails details : [String:Any]) {
        name = details["name"] as! String
        number = details["battle_number"]! as! Int
        year = details["year"]! as? Int
        attackerKing = details["attacker_king"] as! String
        defenderKing = details["defender_king"] as! String
        attackerOutcome = details["attacker_outcome"] as! String
    }
    
}
