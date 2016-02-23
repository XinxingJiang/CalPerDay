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
    @IBOutlet weak var weightUnitLabel: UILabel!
    
    @IBOutlet weak var heightTextField1: UITextField!
    @IBOutlet weak var heightUnitLabel1: UILabel!
    @IBOutlet weak var heightTextField2: UITextField!
    @IBOutlet weak var heightUnitLabel2: UILabel!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var activityLevelButton: UIButton!
    
    @IBOutlet weak var actualMetabolismCalPerDayLabel: UILabel!
    @IBOutlet weak var actualMetabolismCalPerHourLabel: UILabel!
    @IBOutlet weak var restingMetabolismCalPerDayLabel: UILabel!
    
    var alertController: UIAlertController!
    
    var weightInMetricUnit: Double { // kg
        get {
            if usUnitSwitch.on {
                let weightInUsUnit = getDoubleFromString(weightTextField.text!)
                return calculatorBrain.weightInMetricUnit(lbs: weightInUsUnit)
            } else {
                return getDoubleFromString(weightTextField.text!)
            }
        }
    }
    
    var heightInMetricUnit: Double { // cm
        get {
            if usUnitSwitch.on {
                let heightInUsUnit = (getDoubleFromString(heightTextField1.text!), getDoubleFromString(heightTextField2.text!))
                return calculatorBrain.heightInMetricUnit(feet: heightInUsUnit.0, inch: heightInUsUnit.1)
            } else {
                return getDoubleFromString(heightTextField1.text!)
            }
        }
    }
    
    var age: Int {
        get {
            return getIntFromString(ageTextField.text!)
        }
    }
    
    // MARK: - VC life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weightTextField.delegate = self
        heightTextField1.delegate = self
        heightTextField2.delegate = self
        ageTextField.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        calculatorBrain = CalculatorBrain()
        initAlertController()
    }
    
    // MARK: - Text field delegate
    
    func textFieldDidEndEditing(textField: UITextField) {
        updateMetabolism()
        textField.resignFirstResponder()
    }
    
    // MARK: - Unit selection
    
    /*
        Four things to do.
        (1) trigger the other switch.
        (2) show/hide views if needed.
        (3) update weight and height value.
        (4) update weight and height unit.
        (5) update metabolism value.
    */
    @IBAction func clickUsUnit() {
        // (1) trigger the other switch.
        metricUnitSwitch.on = !usUnitSwitch.on
        
        // (2) show/hide views if needed.
        updateViewsVisibility()
        
        // (3) update weight and height value.
        updateWeightValue()
        updateHeightValue()
        
        // (4) update weight and height unit.
        updateUnits()
        
        // (5) update metabolism value.
        updateMetabolism()
    }
    
    @IBAction func clickMetricUnit() {
        // (1) trigger the other switch.
        usUnitSwitch.on = !metricUnitSwitch.on
        
        // (2) show/hide views if needed.
        updateViewsVisibility()
        
        // (3) update weight and height value.
        updateWeightValue()
        updateHeightValue()
        
        // (4) update weight and height unit.
        updateUnits()
        
        // (5) update metabolism value.
        updateMetabolism()
    }
    
    // MARK: - Gender selection
    
    /*
        Two things to do.
        (1) trigger the other switch.
        (2) update metabolism value.
    */
    @IBAction func clickFemale() {
        // (1) trigger the other switch.
        maleSwitch.on = !femaleSwitch.on
        
        // (2) update metabolism value.
        updateMetabolism()
    }
    
    @IBAction func clickMale() {
        // (1) trigger the other switch.
        femaleSwitch.on = !maleSwitch.on
        
        // (2) update metabolism value.
        updateMetabolism()
    }
    
    // MARK: - Activity level selection
    
    /*
        Update metabolism value.
    */
    @IBAction func clickActvityLevelButton(sender: UIButton) {
        presentViewController(alertController, animated: false) {
        }
    }
    
    // MARK: - Internal methods
    
    private func initAlertController() {
        alertController = UIAlertController(title: "Activity Level", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
        alertController.addAction(UIAlertAction(title: Constants.ActivityLevel1, style: UIAlertActionStyle.Default, handler: { (_) in
            self.activityLevelButton.setTitle(Constants.ActivityLevel1, forState: UIControlState.Normal)
            self.updateMetabolism()
        }))
        alertController.addAction(UIAlertAction(title: Constants.ActivityLevel2, style: UIAlertActionStyle.Default, handler: { (_) in
            self.activityLevelButton.setTitle(Constants.ActivityLevel2, forState: UIControlState.Normal)
            self.updateMetabolism()
        }))
        alertController.addAction(UIAlertAction(title: Constants.ActivityLevel3, style: UIAlertActionStyle.Default, handler: { (_) in
            self.activityLevelButton.setTitle(Constants.ActivityLevel3, forState: UIControlState.Normal)
            self.updateMetabolism()
        }))
        alertController.addAction(UIAlertAction(title: Constants.ActivityLevel4, style: UIAlertActionStyle.Default, handler: { (_) in
            self.activityLevelButton.setTitle(Constants.ActivityLevel4, forState: UIControlState.Normal)
            self.updateMetabolism()
        }))
        alertController.addAction(UIAlertAction(title: Constants.ActivityLevel5, style: UIAlertActionStyle.Default, handler: { (_) in
            self.activityLevelButton.setTitle(Constants.ActivityLevel5, forState: UIControlState.Normal)
            self.updateMetabolism()
        }))
    }
    
    private func updateViewsVisibility() {
        heightTextField2.hidden = !usUnitSwitch.on
        heightUnitLabel2.hidden = !usUnitSwitch.on
    }
    
    private func updateUnits() {
        weightUnitLabel.text = usUnitSwitch.on ? "lbs" : "kg"
        heightUnitLabel1.text = usUnitSwitch.on ? "ft" : "cm"
    }
    
    private func updateWeightValue() {
        if usUnitSwitch.on {
            let weightInUsUnit = calculatorBrain.weightInUsUnit(kg: getDoubleFromString(weightTextField.text!))
            weightTextField.text = "\(Int(weightInUsUnit))"
        } else {
            let weightInUsUnit = getDoubleFromString(weightTextField.text!)
            let weightInMetricUnit = calculatorBrain.weightInMetricUnit(lbs: weightInUsUnit)
            weightTextField.text = "\(Int(weightInMetricUnit))"
        }
    }
    
    private func updateHeightValue() {
        if usUnitSwitch.on {
            let heightInMetricUnit = getDoubleFromString(heightTextField1.text!)
            let weightInUsUnit = calculatorBrain.heightInUsUnit(cm: heightInMetricUnit)
            heightTextField1.text = "\(Int(weightInUsUnit.0))"
            heightTextField2.text = "\(Int(weightInUsUnit.1))"
        } else {
            let heightInUsUnit = (getDoubleFromString(heightTextField1.text!), getDoubleFromString(heightTextField2.text!))
            let heightInMetricUnit = calculatorBrain.heightInMetricUnit(feet: heightInUsUnit.0, inch: heightInUsUnit.1)
            heightTextField1.text = "\(Int(heightInMetricUnit))"
        }
    }
    
    private func updateMetabolism() {
        let restingMetabolismPerDay = calculatorBrain.restingMetabolismPerDay(isFeMale: femaleSwitch.on, weightInMetricUnit: weightInMetricUnit, heightInMetricUnit: heightInMetricUnit, age: age)
        let actualMetabolismPerDay = calculatorBrain.actualMetabolismPerDay(restingMetabolismPerDay: restingMetabolismPerDay, activityLevel: activityLevelButton.titleForState(UIControlState.Normal)!)
        let actualMetabolismPerHour = calculatorBrain.actualMetabolismPerHour(actualMetabolismPerDay: actualMetabolismPerDay)
        actualMetabolismCalPerDayLabel.text = "\(Int(actualMetabolismPerDay))"
        actualMetabolismCalPerHourLabel.text = "\(Int(actualMetabolismPerHour))"
        restingMetabolismCalPerDayLabel.text = "\(Int(restingMetabolismPerDay))"
    }
    
    private func getIntFromString(s: String) -> Int {
        if s == "" {
            return 0
        } else {
            return Int(s)!
        }
    }
    
    private func getDoubleFromString(s: String) -> Double {
        if s == "" {
            return 0.0
        }
        return Double(s)!
    }
    
    // MARK: - Constants
    
    struct Constants {
        static let ActivityLevel1 = "Sedentary"
        static let ActivityLevel2 = "Lightly Active"
        static let ActivityLevel3 = "Moderately Active"
        static let ActivityLevel4 = "Very Active"
        static let ActivityLevel5 = "Extremely Active"
    }
}