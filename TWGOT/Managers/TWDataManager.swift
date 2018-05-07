//
//  TWDataManager.swift
//  TWGOT
//
//  Created by mac on 06/05/18.
//  Copyright © 2018 Adithya. All rights reserved.
//

import Foundation

class TWDataManager {
    static let sharedManager = TWDataManager()
    
    func getListOfBattles(onSuccess successHandler: @escaping (_ response:[Battle]) -> Void, onfailure failureHandler: @escaping (_ errorResponse : Any) -> Void){
        TWServiceManager.sharedManager.requestForListOfBattles(onSuccess: { (successResponse) in
          var BattleList = [Battle]()
            for each in successResponse{
                let battle = Battle.init(withDetails: each as! [String:Any])
                BattleList.append(battle)
            }
            successHandler(BattleList)
        }) { (errorResponse) in
            
        }
    }
    
}
