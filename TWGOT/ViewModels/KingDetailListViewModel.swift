//
//  KingDetailListViewModel.swift
//  TWGOT
//
//  Created by mac on 07/05/18.
//  Copyright © 2018 Adithya. All rights reserved.
//

import Foundation

class KingDetailListViewModel {
    
    var kingInfo : King!
    var kingDetailsInfoNames = ["Attacks made","Defended","Total wins", "Attacks won", "Defended Successfully"]
    var detailsInfo = [Int]()
    var displayBattleList = [[String:String]]()
    
    func displayDetailInformation(){
        self.progressInformation()
        self.battleListInformation()
    }
    
    func progressInformation(){
        detailsInfo.append(kingInfo.attacks)
        detailsInfo.append(kingInfo.defends)
        detailsInfo.append(kingInfo.victories)
        detailsInfo.append(calculateAttackingWins())
        detailsInfo.append(calculateDefendingWins())
    }
    
    func calculateAttackingWins() -> Int{
        var winCount = 0
        for eachBattle in kingInfo.battlesList {
            if kingInfo.name == eachBattle.attackerKing{
                if  eachBattle.attackerOutcome == "win" {
                    winCount += 1
                }
            }
        }
        return winCount
    }
    
    func calculateDefendingWins() -> Int{
        var winCount = 0
        for eachBattle in kingInfo.battlesList {
            if kingInfo.name == eachBattle.defenderKing{
                if  !(eachBattle.attackerOutcome == "win") {
                    winCount += 1
                }
            }
        }
        return winCount
    }
    
    func battleListInformation(){
        for eachBattle in kingInfo.battlesList {
            var battleInfo = [String:String]()
            battleInfo["name"] = eachBattle.name
            battleInfo["opponent"] = (kingInfo.name == eachBattle.attackerKing) ? eachBattle.defenderKing : eachBattle.attackerKing
            self.displayBattleList.append(battleInfo)
        }
    }

}
