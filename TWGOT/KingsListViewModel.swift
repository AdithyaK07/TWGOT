//
//  KingsListViewModel.swift
//  TWGOT
//
//  Created by mac on 06/05/18.
//  Copyright © 2018 Adithya. All rights reserved.
//

import Foundation

class KingsListViewModel {
    
    var viewDelegate : DatasourceDelegate?
    var battles: [Battle] = [Battle]()
    var kingsList = [String:King]()

    var kings  = [King](){
        didSet{
          self.viewDelegate?.updatedDatesource()
        }
    }

    func getListOfBattles(){
        TWDataManager.sharedManager.getListOfBattles(onSuccess: {[unowned self] (battlesList) in
            self.battles = battlesList
            self.generateListOfKingsFromBattles()
            print(self.battles)
        }) { (error) in
            print(error)
        }
    }
    
    func generateListOfKingsFromBattles(){
        
        for eachBattle in self.battles{
            if !kingsList.keys.contains(eachBattle.attackerKing) {
                kingsList[eachBattle.attackerKing] = King.init(withName: eachBattle.attackerKing)
            }
            if !kingsList.keys.contains(eachBattle.defenderKing){
                kingsList[eachBattle.defenderKing] = King.init(withName: eachBattle.defenderKing)
            }
            kingsList[eachBattle.attackerKing]?.attacks += 1
            kingsList[eachBattle.defenderKing]?.defends += 1
            
            let result : Int
            if eachBattle.attackerOutcome == "win" {
                result = 1
                kingsList[eachBattle.attackerKing]?.victories += 1
            }
            else {
                result = 2
                kingsList[eachBattle.defenderKing]?.victories += 1
            }
            
            let (r1,r2) = self.calculateUpdatedRatings(withR1: kingsList[eachBattle.attackerKing]!.ratingScore, withR2: kingsList[eachBattle.defenderKing]!.ratingScore, withResult: result)
            kingsList[eachBattle.attackerKing]?.ratingScore = r1
            kingsList[eachBattle.defenderKing]?.ratingScore = r2
        }
        var kingList = [King]()
        for (_,value) in self.kingsList{
            kingList.append(value)
        }
        self.kings = kingList
    }
    
        func calculateUpdatedRatings(withR1 r1:Double, withR2 r2:Double, withResult result:Int) -> (Double, Double){
            let R1 = self.computeTransformRating(for: r1)
            let R2 = Double(truncating: self.computeTransformRating(for: r2) as NSNumber)
            let (e1,e2) = self.calculateExpectedRating(withR1: R1, withR2: R2)
            let (s1,s2) = self.calculateActualScoreForResult(result)
            let k :Double = 32
            
            let firstRating = r1+(k * (s1 - e1))
            let secondRating = r2+(k * (s2 - e2))
            return (firstRating,secondRating)
        }
    
    func computeTransformRating(for rating:Double) -> Double{
        return pow(10, (rating/400.0))
    }
    func calculateExpectedRating(withR1 r1:Double, withR2 r2:Double) -> (Double,Double) {
            let sum = r1+r2
        return(Double(r1/(sum)), Double(r2/(sum)))
    }
    func calculateActualScoreForResult(_ result:Int) -> (Double,Double){
        switch result{
        case 0 :
            return (0.5,0.5)
        case 1 :
            return (1,0)
        case 2 :
            return (0,1)
        default:
            return (0,0)
        }
        
    }

                
    
    
    
}
