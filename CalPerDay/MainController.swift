//
//  MainController.swift
//  CalPerDay
//
//  Created by Xinxing Jiang on 2/15/16.
//  Copyright © 2016 jiang. All rights reserved.
//

import UIKit

class MainController: UIViewController, UITextFieldDelegate {
    
    var calculatorBrain: CalculatorBrain!
    
    // MARK: - Outlets
    
    @IBOutlet weak var usUnitSwitch: UISwitch!
    @IBOutlet weak var metricUnitSwitch: UISwitch!
    
    @IBOutlet weak var femaleSwitch: UISwitch!
    @IBOutlet weak var maleSwitch: UISwitch!
    
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField1: UITextField!
    @IBOutlet weak var heightTextField2: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var activityLevelButton: UIButton!
    
    @IBOutlet weak var actualMetabolismCalPerDayLabel: UILabel!
    @IBOutlet weak var actualMetabolismCalPerHourLabel: UILabel!
    @IBOutlet weak var restingMetabolismCalPerDayLabel: UILabel!
    
//    var weightInMetricUnit: Double {
//        get {
//            if calculatorBrain.isUsUnitSelected! { // us unit
//                return calculatorBrain.weightInUsUnit(kg: getDoubleFromString(mainView.weightTextField.text!))
//            } else { // metric unit
//                return getDoubleFromString(mainView.weightTextField.text!)
//            }
//        }
//    }
//    
//    var heightInMetricUnit: Double {
//        get {
//            if calculatorBrain.isUsUnitSelected! { // us unit
//                return calculatorBrain.heightInMetricUnit(feet: getDoubleFromString(mainView.firstHeightTextField.text!), inch: getDoubleFromString(mainView.secondHeightTextField.text!))
//            } else { // metric unit
//                return getDoubleFromString(mainView.firstHeightTextField.text!)
//            }
//        }
//    }
    
    // MARK: - VC life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorBrain = CalculatorBrain(isUsUnitSelected: true, isFemaleSelected: true)
    }
    
    // MARK: - Text field delegate
    
//    func textFieldDidEndEditing(textField: UITextField) {
//        if textField == mainView.weightTextField {
//            if calculatorBrain.isUsUnitSelected! {
////                calculatorBrain.weightInMetricUnit = CalculatorBrain.Constants.OneKgToLbs * Double(getIntFromString(textField.text!))
//            } else {
////                calculatorBrain.weightInMetricUnit = Double(getIntFromString(textField.text!))
//            }
//        } else {
//            if calculatorBrain.isUsUnitSelected! {
////                calculatorBrain.heightInMetricUnit = calculatorBrain.getHeightInMetricUnit(feet: getIntFromString(mainView.firstHeightTextField.text!), inch: getIntFromString(mainView.secondHeightTextField.text!))
//            } else {
////                calculatorBrain.heightInMetricUnit = Double(getIntFromString(mainView.firstHeightTextField.text!))
//            }
//        }
//    }
    
    // MARK: - Action
    
    @IBAction func clickUsUnit() {
        metricUnitSwitch.on = !usUnitSwitch.on
        convertWeight()
        convertHeight()
    }
    
    @IBAction func clickMetricUnit() {
        usUnitSwitch.on = !metricUnitSwitch.on
        convertWeight()
        convertHeight()
    }
    
    @IBAction func clickFemale() {
        maleSwitch.on = !femaleSwitch.on
    }
    
    @IBAction func clickMale() {
        femaleSwitch.on = !maleSwitch.on
    }
    
    private func convertWeight() {
//        mainView.weightTextField.resignFirstResponder()
//        
//        calculatorBrain.isUsUnitSelected = mainView.usUnitSwitch.on
//        
//        if calculatorBrain.isUsUnitSelected! { // convert to us unit
////            let weight = getIntFromString(mainView.weightTextField.text!)
////            mainView.weightTextField.text = "\(calculatorBrain.getWeightInUsUnit())"
//            mainView.weightUnitLabel.text = MainView.Constants.WeightUnitLabelUSText
//        } else { // convert to metric unit
////            let weight = getIntFromString(mainView.weightTextField.text!)
//            mainView.weightTextField.text = "\(calculatorBrain.weightInMetricUnit)"
//            mainView.weightUnitLabel.text = MainView.Constants.WeightUnitLabelI18nText
//        }
    }
    
    private func convertHeight() {
//        mainView.firstHeightTextField.resignFirstResponder()
//        mainView.secondHeightTextField.resignFirstResponder()
//        
//        calculatorBrain.isUsUnitSelected = mainView.usUnitSwitch.on
//        
//        if calculatorBrain.isUsUnitSelected! { // convert to us unit
//            mainView.secondHeightTextField.hidden = false
//            mainView.secondHeightUnitLabel.hidden = false
//            mainView.firstHeightUnitLabel.text = MainView.Constants.FirstHeightUnitLabelUSText
//            mainView.secondHeightUnitLabel.text = MainView.Constants.SecondHeightUnitLabelUSText
//            
////            if let height = Int(mainView.firstHeightTextField.text!) {
////                let (feet, inch) = calculatorBrain.getHeightInUsUnit()
////                mainView.firstHeightTextField.text = "\(feet)"
////                mainView.secondHeightTextField.text = "\(inch)"
////            }
//        } else { // convert to metric unit
//            mainView.secondHeightTextField.hidden = true
//            mainView.secondHeightUnitLabel.hidden = true
//            mainView.firstHeightUnitLabel.text = MainView.Constants.FirstHeightUnitLabelMetricText
//            
////            let (feet, inch) = (getIntFromString(mainView.firstHeightTextField.text!), getIntFromString(mainView.secondHeightTextField.text!))
////            mainView.firstHeightTextField.text = "\(Int(round(calculatorBrain.getHeightInMetricUnit(feet: feet, inch: inch))))"
//        }
    }
    
//    private func getIntFromString(s: String) -> Int {
//        if s == "" {
//            return 0
//        } else {
//            return Int(s)!
//        }
//    }
    
    private func getDoubleFromString(s: String) -> Double {
        if s == "" {
            return 0.0
        }
        return Double(s)!
    }
}