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
    
    func restingMetabolismPerDay(isFeMale isFeMale: Bool, weightInMetricUnit: Double, heightInMetricUnit: Double, age: Int) -> Double {
        if isFeMale {
            return 655 + (4.35 * weightInMetricUnit * Constants.OneKgToLbs) + (4.7 * heightInMetricUnit / Constants.OneInchToCm) - (4.7 * Double(age))
        } else {
            return 66 + (6.23 * weightInMetricUnit * Constants.OneKgToLbs) + (12.7 * heightInMetricUnit / Constants.OneInchToCm) - (6.8 * Double(age))
        }
    }
    
    func actualMetabolismPerDay(restingMetabolismPerDay restingMetabolismPerDay: Double, activityLevel: String) -> Double {
        switch activityLevel {
        case MainController.Constants.ActivityLevel1: return restingMetabolismPerDay * 1.2
        case MainController.Constants.ActivityLevel2: return restingMetabolismPerDay * 1.375
        case MainController.Constants.ActivityLevel3: return restingMetabolismPerDay * 1.55
        case MainController.Constants.ActivityLevel4: return restingMetabolismPerDay * 1.725
        case MainController.Constants.ActivityLevel5: return restingMetabolismPerDay * 1.9
        default: return 0
        }
    }
    
    func actualMetabolismPerHour(actualMetabolismPerDay actualMetabolismPerDay: Double) -> Double {
        return actualMetabolismPerDay / 24
    }
    
    // MARK: - Constants
    
    struct Constants {
        static let OneKgToLbs = 2.20 // 1 kg = 2.20 lbs
        static let OneFootToCm = 30.48 // 1 foot = 30.48 cm
        static let OneInchToCm = 2.54 // 1 inch = 2.54 cm
    }
}