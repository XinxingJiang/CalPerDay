//
//  CalculatorBrain.swift
//  CalPerDay
//
//  Created by Xinxing Jiang on 2/16/16.
//  Copyright © 2016 jiang. All rights reserved.
//

import Foundation

class CalculatorBrain {
    var isUsUnitSelected: Bool!
    var isFemaleSelected: Bool!
    
    init(isUsUnitSelected: Bool, isFemaleSelected: Bool) {
        self.isUsUnitSelected = isUsUnitSelected
        self.isFemaleSelected = isFemaleSelected
    }
    
    func kgToLbs(kg: Int) -> Int {
        return Int(round(Double(kg) * Constants.OneKgToLbs))
    }
    
    func lbsToKg(lbs: Int) -> Int {
        return Int(round(Double(lbs) / Constants.OneKgToLbs))
    }
    
    // MARK: - Constants
    
    struct Constants {
        static let OneKgToLbs = 2.20462262
    }
}