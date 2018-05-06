//
//  TWServiceManager.swift
//  TWGOT
//
//  Created by mac on 06/05/18.
//  Copyright © 2018 Adithya. All rights reserved.
//

import UIKit

class TWServiceManager {
    static let sharedManager = TWServiceManager()
    func requestForListOfBattles(onSuccess successHandler: @escaping (_ response:[Any]) -> Void, onfailure failureHandler: @escaping (_ errorResponse : Any) -> Void){
        let battleListService = TWService()
        battleListService.url = "http://starlord.hackerearth.com/gotjson"
        battleListService.requestForData(onSuccess: { (success) in
            successHandler(success as! [Any])
            //print(success)
        }) { (failure) in
            print(failure)
        }
    }
}
