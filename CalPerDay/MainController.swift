//
//  MainController.swift
//  CalPerDay
//
//  Created by Xinxing Jiang on 2/15/16.
//  Copyright © 2016 jiang. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    var mainView: MainView!
    
    var calculatorBrain: CalculatorBrain!
    
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
    }
    
    // MARK: - Action
    
    func usUnitSelected() {
        mainView.i18nUnitSwitch.on = !mainView.usUnitSwitch.on
        convertWeight()
    }
    
    func i18nUnitSelected() {
        mainView.usUnitSwitch.on = !mainView.i18nUnitSwitch.on
        convertWeight()
    }
    
    private func convertWeight() {
        calculatorBrain.isUsUnitSelected = mainView.usUnitSwitch.on
        
        if calculatorBrain.isUsUnitSelected! { // convert to metric unit
            if let weight = Int(mainView.weightTextField.text!) {
                mainView.weightTextField.text = "\(calculatorBrain.kgToLbs(weight))"
            }
            mainView.weightUnitLabel.text = MainView.Constants.WeightUnitLabelUSText
        } else { // convert to us unit
            if let weight = Int(mainView.weightTextField.text!) {
                mainView.weightTextField.text = "\(calculatorBrain.lbsToKg(weight))"
            }
            mainView.weightUnitLabel.text = MainView.Constants.WeightUnitLabelI18nText
        }
    }
    
    func femaleSelected() {
        mainView.maleSwitch.on = !mainView.femaleSwitch.on
    }
    
    func maleSelected() {
        mainView.femaleSwitch.on = !mainView.maleSwitch.on
    }
}

