//
//  MainController.swift
//  CalPerDay
//
//  Created by Xinxing Jiang on 2/15/16.
//  Copyright © 2016 jiang. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
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
    
//    var weightInMetricUnit: Double! // kg
//    var heightInMetricUnit: Double! // cm
    
    // MARK: - VC life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        calculatorBrain = CalculatorBrain()
        initAlertController()
    }
    
    private func initAlertController() {
        alertController = UIAlertController(title: "Activity Level", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
        alertController.addAction(UIAlertAction(title: "Sedentary", style: UIAlertActionStyle.Default, handler: { (_) in
            self.activityLevelButton.setTitle("Sedentary", forState: UIControlState.Normal)
        }))
        alertController.addAction(UIAlertAction(title: "Lightly Active", style: UIAlertActionStyle.Default, handler: { (_) in
            self.activityLevelButton.setTitle("Lightly Active", forState: UIControlState.Normal)
        }))
        alertController.addAction(UIAlertAction(title: "Moderately Active", style: UIAlertActionStyle.Default, handler: { (_) in
            self.activityLevelButton.setTitle("Moderately Active", forState: UIControlState.Normal)
        }))
        alertController.addAction(UIAlertAction(title: "Very Active", style: UIAlertActionStyle.Default, handler: { (_) in
            self.activityLevelButton.setTitle("Very Active", forState: UIControlState.Normal)
        }))
        alertController.addAction(UIAlertAction(title: "Extremely Active", style: UIAlertActionStyle.Default, handler: { (_) in
            self.activityLevelButton.setTitle("Extremely Active", forState: UIControlState.Normal)
        }))
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
            self.updateMetabolism()
        }
    }
    
    // MARK: - Internal methods
    
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
            let weightInMetricUnit = getDoubleFromString(weightTextField.text!)
            let weightInUsUnit = calculatorBrain.weightInUsUnit(kg: weightInMetricUnit)
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
}