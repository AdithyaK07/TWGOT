//
//  KingsListViewModel.swift
//  TWGOT
//
//  Created by mac on 06/05/18.
//  Copyright © 2018 Adithya. All rights reserved.
//

import Foundation

class KingsListViewModel {

var battles = [Battle]()
var kingsList = [King]()

    func getListOfBattles(){
        TWDataManager.sharedManager.getListOfBattles(onSuccess: {[unowned self] (battlesList) in
            self.battles = battlesList
            print(self.battles)
        }) { (error) in
            print(error)
        }
    }
    func generateListOfKings(){
        
    }
    
    
    
}
