//
//  CalPerDayTests.swift
//  CalPerDayTests
//
//  Created by Xinxing Jiang on 2/15/16.
//  Copyright © 2016 jiang. All rights reserved.
//

import XCTest
@testable import CalPerDay

class CalPerDayTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUnitConversion() {
        let calculatorBrain = CalculatorBrain()
        XCTAssertEqualWithAccuracy(calculatorBrain.weightInMetricUnit(lbs: 1), 0.45, accuracy: 0.01)
        XCTAssertEqualWithAccuracy(calculatorBrain.weightInUsUnit(kg: 1), 2.20, accuracy: 0.01)
        XCTAssertEqualWithAccuracy(calculatorBrain.heightInUsUnit(cm: 180).0, 5, accuracy: 0.01)
        XCTAssertEqualWithAccuracy(calculatorBrain.heightInUsUnit(cm: 180).1, 10.87, accuracy: 0.01)
        XCTAssertEqualWithAccuracy(calculatorBrain.heightInMetricUnit(feet: 5, inch: 11), 180.34, accuracy: 0.01)
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock {
//            // Put the code you want to measure the time of here.
//        }
//    }
}
