//
//  MainController.swift
//  CalPerDay
//
//  Created by Xinxing Jiang on 2/15/16.
//  Copyright © 2016 jiang. All rights reserved.
//

import UIKit

class MainController: UIViewController, UITextFieldDelegate {

    var mainView: MainView!
    
    var calculatorBrain: CalculatorBrain!
    
    var weightInMetricUnit: Double {
        get {
            if calculatorBrain.isUsUnitSelected! { // us unit
                return calculatorBrain.weightInUsUnit(kg: getDoubleFromString(mainView.weightTextField.text!))
            } else { // metric unit
                return getDoubleFromString(mainView.weightTextField.text!)
            }
        }
    }
    
    var heightInMetricUnit: Double {
        get {
            if calculatorBrain.isUsUnitSelected! { // us unit
                return calculatorBrain.heightInMetricUnit(feet: getDoubleFromString(mainView.firstHeightTextField.text!), inch: getDoubleFromString(mainView.secondHeightTextField.text!))
            } else { // metric unit
                return getDoubleFromString(mainView.firstHeightTextField.text!)
            }
        }
    }
    
    // MARK: - VC life cycle
    
    override func loadView() {
        super.loadView()
        mainView = MainView(mainController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculatorBrain = CalculatorBrain(isUsUnitSelected: true, isFemaleSelected: true)
        
        mainView.usUnitSwitch.addTarget(self, action: Selector("usUnitSelected"), forControlEvents: UIControlEvents.TouchUpInside)
        mainView.i18nUnitSwitch.addTarget(self, action: Selector("i18nUnitSelected"), forControlEvents: UIControlEvents.TouchUpInside)
        mainView.femaleSwitch.addTarget(self, action: Selector("femaleSelected"), forControlEvents: UIControlEvents.TouchUpInside)
        mainView.maleSwitch.addTarget(self, action: Selector("maleSelected"), forControlEvents: UIControlEvents.TouchUpInside)
        
        mainView.weightTextField.delegate = self
        mainView.firstHeightTextField.delegate = self
        mainView.secondHeightTextField.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Text field delegate
    
    func textFieldDidEndEditing(textField: UITextField) {
        if textField == mainView.weightTextField {
            if calculatorBrain.isUsUnitSelected! {
//                calculatorBrain.weightInMetricUnit = CalculatorBrain.Constants.OneKgToLbs * Double(getIntFromString(textField.text!))
            } else {
//                calculatorBrain.weightInMetricUnit = Double(getIntFromString(textField.text!))
            }
        } else {
            if calculatorBrain.isUsUnitSelected! {
//                calculatorBrain.heightInMetricUnit = calculatorBrain.getHeightInMetricUnit(feet: getIntFromString(mainView.firstHeightTextField.text!), inch: getIntFromString(mainView.secondHeightTextField.text!))
            } else {
//                calculatorBrain.heightInMetricUnit = Double(getIntFromString(mainView.firstHeightTextField.text!))
            }
        }
    }
    
    // MARK: - Action
    
    func usUnitSelected() {
        mainView.i18nUnitSwitch.on = !mainView.usUnitSwitch.on
        convertWeight()
        convertHeight()
    }
    
    func i18nUnitSelected() {
        mainView.usUnitSwitch.on = !mainView.i18nUnitSwitch.on
        convertWeight()
        convertHeight()
    }
    
    func femaleSelected() {
        mainView.maleSwitch.on = !mainView.femaleSwitch.on
    }
    
    func maleSelected() {
        mainView.femaleSwitch.on = !mainView.maleSwitch.on
    }
    
    private func convertWeight() {
        mainView.weightTextField.resignFirstResponder()
        
        calculatorBrain.isUsUnitSelected = mainView.usUnitSwitch.on
        
        if calculatorBrain.isUsUnitSelected! { // convert to us unit
//            let weight = getIntFromString(mainView.weightTextField.text!)
//            mainView.weightTextField.text = "\(calculatorBrain.getWeightInUsUnit())"
            mainView.weightUnitLabel.text = MainView.Constants.WeightUnitLabelUSText
        } else { // convert to metric unit
//            let weight = getIntFromString(mainView.weightTextField.text!)
            mainView.weightTextField.text = "\(calculatorBrain.weightInMetricUnit)"
            mainView.weightUnitLabel.text = MainView.Constants.WeightUnitLabelI18nText
        }
    }
    
    private func convertHeight() {
        mainView.firstHeightTextField.resignFirstResponder()
        mainView.secondHeightTextField.resignFirstResponder()
        
        calculatorBrain.isUsUnitSelected = mainView.usUnitSwitch.on
        
        if calculatorBrain.isUsUnitSelected! { // convert to us unit
            mainView.secondHeightTextField.hidden = false
            mainView.secondHeightUnitLabel.hidden = false
            mainView.firstHeightUnitLabel.text = MainView.Constants.FirstHeightUnitLabelUSText
            mainView.secondHeightUnitLabel.text = MainView.Constants.SecondHeightUnitLabelUSText
            
//            if let height = Int(mainView.firstHeightTextField.text!) {
//                let (feet, inch) = calculatorBrain.getHeightInUsUnit()
//                mainView.firstHeightTextField.text = "\(feet)"
//                mainView.secondHeightTextField.text = "\(inch)"
//            }
        } else { // convert to metric unit
            mainView.secondHeightTextField.hidden = true
            mainView.secondHeightUnitLabel.hidden = true
            mainView.firstHeightUnitLabel.text = MainView.Constants.FirstHeightUnitLabelMetricText
            
//            let (feet, inch) = (getIntFromString(mainView.firstHeightTextField.text!), getIntFromString(mainView.secondHeightTextField.text!))
//            mainView.firstHeightTextField.text = "\(Int(round(calculatorBrain.getHeightInMetricUnit(feet: feet, inch: inch))))"
        }
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