//
//  RatingsTest.swift
//  TWGOTTests
//
//  Created by mac on 06/05/18.
//  Copyright © 2018 Adithya. All rights reserved.
//

import XCTest

class RatingsTest: XCTestCase {
    
    func testTransformedRatint(){
        let kingsListModel = KingsListViewModel()
        let result = kingsListModel.computeTransformRating(for: 800.0)
        XCTAssertEqual(result,100 )
    }
    
    func testExpectedRating(){
        let kingsListModel = KingsListViewModel()
       let result = kingsListModel.calculateExpectedRating(withR1: 10.0, withR2: 10.0)
        XCTAssertEqual(result.0, 0.5)
    }
    
    func testCalculateUpdatedRatings(){
        let kingsListModel = KingsListViewModel()
        let result = kingsListModel.calculateUpdatedRatings(withR1: 400.0, withR2: 400.0, withResult: 1)
        XCTAssertEqual(result.0, 416.0)
        XCTAssertEqual(result.1, 384.0)
    }
}
