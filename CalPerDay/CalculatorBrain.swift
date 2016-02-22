//
//  CalculatorBrain.swift
//  CalPerDay
//
//  Created by Xinxing Jiang on 2/16/16.
//  Copyright © 2016 jiang. All rights reserved.
//

import Foundation

class CalculatorBrain {
    // kg to lbs
    func weightInUsUnit(kg kg: Double) -> Double {
        return kg * Constants.OneKgToLbs
    }
    
    // lbs to kg
    func weightInMetricUnit(lbs lbs: Double) -> Double {
        return lbs / Constants.OneKgToLbs
    }
    
    // cm to (feet, inch)
    func heightInUsUnit(cm cm: Double) -> (Double, Double) {
        let feet = floor(cm / Constants.OneFootToCm)
        let inch = (cm - feet * Constants.OneFootToCm) / Constants.OneInchToCm
        return (feet, inch)
    }
    
    // (feet, inch) to cm
    func heightInMetricUnit(feet feet: Double, inch: Double) -> Double {
        return feet * Constants.OneFootToCm + inch * Constants.OneInchToCm
    }
    
    // MARK: - Constants
    
    struct Constants {
        static let OneKgToLbs = 2.20 // 1 kg = 2.20 lbs
        static let OneFootToCm = 30.48 // 1 foot = 30.48 cm
        static let OneInchToCm = 2.54 // 1 inch = 2.54 cm
    }
}