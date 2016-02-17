//
//  MainView.swift
//  CalPerDay
//
//  Created by Xinxing Jiang on 2/15/16.
//  Copyright © 2016 jiang. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    // MARK: - Subviews
    
    var usUnitSwitch: UISwitch!
    var i18nUnitSwitch: UISwitch!
    var usUnitLabel: UILabel!
    var i18nUnitLabel: UILabel!
    
    var femaleSwitch: UISwitch!
    var maleSwitch: UISwitch!
    var femaleLabel: UILabel!
    var maleLabel: UILabel!
    
    var weightLabel: UILabel!
    var weightTextField: UITextField!
    var weightUnitLabel: UILabel!
    
    var heightLabel: UILabel!
    var firstHeightTextField: UITextField!
    var firstHeightUnitLabel: UILabel!
    var secondHeightTextField: UITextField!
    var secondHeightUnitLabel: UILabel!
    
    var ageLabel: UILabel!
    var ageTextField: UITextField!
    
    var activityLevelLabel: UILabel!
    var activityLevelButton: UIButton!
    
    // MARK: - Init
    
    convenience init(mainController: MainController) {
        self.init()
        self.backgroundColor = Constants.BackgroundColor
        mainController.view.addSubview(self)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        let heightCon = NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: mainController.view, attribute: .Height, multiplier: 1, constant: 0)
        let widthCon = NSLayoutConstraint(item: self, attribute: .Width, relatedBy: .Equal, toItem: mainController.view, attribute: .Width, multiplier: 1, constant: 0)
        mainController.view.addConstraints([heightCon, widthCon])
        
        initSubviews()
    }
    
    // MARK: - Init subviews
    
    private func initSubviews() {
        initUnitPart()
        initGenderPart()
        initWeightPart()
        initHeightPart()
        initAgePart()
        initActivityLevelPart()
    }
    
    // MARK: - Unit part
    
    private func initUnitPart() {
        initUsUnitLabel()
        initUsUnitSwitch()
        initI18nUnitSwitch()
        initI18nUnitLabel()
    }
    
    private func initUsUnitLabel() {
        usUnitLabel = UILabel()
        usUnitLabel.text = Constants.UsUnitLabelText
        
        self.addSubview(usUnitLabel)
        usUnitLabel.translatesAutoresizingMaskIntoConstraints = false
        let topCon = NSLayoutConstraint(item: usUnitLabel, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1, constant: Constants.UsUnitLabelTopGap)
        let trailingCon = NSLayoutConstraint(item: usUnitLabel, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: Constants.UsUnitLabelTrailingGap)
        self.addConstraints([topCon, trailingCon])
    }
    
    private func initUsUnitSwitch() {
        usUnitSwitch = UISwitch()
        usUnitSwitch.setOn(true, animated: false)
        
        self.addSubview(usUnitSwitch)
        usUnitSwitch.translatesAutoresizingMaskIntoConstraints = false
        let centerYCon = NSLayoutConstraint(item: usUnitSwitch, attribute: .CenterY, relatedBy: .Equal, toItem: usUnitLabel, attribute: .CenterY, multiplier: 1, constant: 0)
        let trailingCon = NSLayoutConstraint(item: usUnitSwitch, attribute: .Trailing, relatedBy: .Equal, toItem: usUnitLabel, attribute: .Leading, multiplier: 1, constant: Constants.UsUnitSwitchTrailingGap)
        self.addConstraints([centerYCon, trailingCon])
    }
    
    private func initI18nUnitSwitch() {
        i18nUnitSwitch = UISwitch()
        i18nUnitSwitch.setOn(false, animated: false)
        
        self.addSubview(i18nUnitSwitch)
        i18nUnitSwitch.translatesAutoresizingMaskIntoConstraints = false
        let centerYCon = NSLayoutConstraint(item: i18nUnitSwitch, attribute: .CenterY, relatedBy: .Equal, toItem: usUnitLabel, attribute: .CenterY, multiplier: 1, constant: 0)
        let leadingCon = NSLayoutConstraint(item: i18nUnitSwitch, attribute: .Leading, relatedBy: .Equal, toItem: usUnitLabel, attribute: .Trailing, multiplier: 1, constant: Constants.I18nUnitSwitchLeadingGap)
        self.addConstraints([centerYCon, leadingCon])
    }
    
    private func initI18nUnitLabel() {
        i18nUnitLabel = UILabel()
        i18nUnitLabel.text = Constants.I18nUnitLabelText
        
        self.addSubview(i18nUnitLabel)
        i18nUnitLabel.translatesAutoresizingMaskIntoConstraints = false
        let centerYCon = NSLayoutConstraint(item: i18nUnitLabel, attribute: .CenterY, relatedBy: .Equal, toItem: i18nUnitSwitch, attribute: .CenterY, multiplier: 1, constant: 0)
        let leadingCon = NSLayoutConstraint(item: i18nUnitLabel, attribute: .Leading, relatedBy: .Equal, toItem: i18nUnitSwitch, attribute: .Trailing, multiplier: 1, constant: Constants.I18nUnitLabelLeadingGap)
        self.addConstraints([centerYCon, leadingCon])
    }
    
    // MARK: - Gender part
    
    private func initGenderPart() {
        initFemaleSwitch()
        initFemaleLabel()
        initMaleSwitch()
        initMaleLabel()
    }
    
    private func initFemaleSwitch() {
        femaleSwitch = UISwitch()
        femaleSwitch.setOn(true, animated: false)
        
        self.addSubview(femaleSwitch)
        femaleSwitch.translatesAutoresizingMaskIntoConstraints = false
        let topCon = NSLayoutConstraint(item: femaleSwitch, attribute: .Top, relatedBy: .Equal, toItem: usUnitSwitch, attribute: .Bottom, multiplier: 1, constant: Constants.FemaleSwitchTopGap)
        let leadingCon = NSLayoutConstraint(item: femaleSwitch, attribute: .Leading, relatedBy: .Equal, toItem: usUnitSwitch, attribute: .Leading, multiplier: 1, constant: 0)
        self.addConstraints([topCon, leadingCon])
    }
    
    private func initFemaleLabel() {
        femaleLabel = UILabel()
        femaleLabel.text = Constants.FemaleLabelText
        
        self.addSubview(femaleLabel)
        femaleLabel.translatesAutoresizingMaskIntoConstraints = false
        let centerYCon = NSLayoutConstraint(item: femaleLabel, attribute: .CenterY, relatedBy: .Equal, toItem: femaleSwitch, attribute: .CenterY, multiplier: 1, constant: 0)
        let leadingCon = NSLayoutConstraint(item: femaleLabel, attribute: .Leading, relatedBy: .Equal, toItem: femaleSwitch, attribute: .Trailing, multiplier: 1, constant: Constants.FemaleLabelLeadingGap)
        self.addConstraints([centerYCon, leadingCon])
    }
    
    private func initMaleSwitch() {
        maleSwitch = UISwitch()
        maleSwitch.setOn(false, animated: false)
        
        self.addSubview(maleSwitch)
        maleSwitch.translatesAutoresizingMaskIntoConstraints = false
        let centerYCon = NSLayoutConstraint(item: maleSwitch, attribute: .CenterY, relatedBy: .Equal, toItem: femaleLabel, attribute: .CenterY, multiplier: 1, constant: 0)
        let leadingCon = NSLayoutConstraint(item: maleSwitch, attribute: .Leading, relatedBy: .Equal, toItem: femaleLabel, attribute: .Trailing, multiplier: 1, constant: Constants.MaleSwitchLeadingGap)
        self.addConstraints([centerYCon, leadingCon])
    }
    
    private func initMaleLabel() {
        maleLabel = UILabel()
        maleLabel.text = Constants.MaleLabelText
        
        self.addSubview(maleLabel)
        maleLabel.translatesAutoresizingMaskIntoConstraints = false
        let centerYCon = NSLayoutConstraint(item: maleLabel, attribute: .CenterY, relatedBy: .Equal, toItem: maleSwitch, attribute: .CenterY, multiplier: 1, constant: 0)
        let leadingCon = NSLayoutConstraint(item: maleLabel, attribute: .Leading, relatedBy: .Equal, toItem: maleSwitch, attribute: .Trailing, multiplier: 1, constant: Constants.MaleLabelLeadingGap)
        self.addConstraints([centerYCon, leadingCon])
    }
    
    // MARK: - Weight part
    
    private func initWeightPart() {
        initWeightLabel()
        initWeightTextField()
        initWeightUnitLabel()
    }
    
    private func initWeightLabel() {
        weightLabel = UILabel()
        weightLabel.text = Constants.WeightLabelText
        
        self.addSubview(weightLabel)
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        let topCon = NSLayoutConstraint(item: weightLabel, attribute: .Top, relatedBy: .Equal, toItem: femaleSwitch, attribute: .Bottom, multiplier: 1, constant: Constants.WeightLabelTopGap)
        let leadingCon = NSLayoutConstraint(item: weightLabel, attribute: .Leading, relatedBy: .Equal, toItem: femaleSwitch, attribute: .Leading, multiplier: 1, constant: 0)
        self.addConstraints([topCon, leadingCon])
    }
    
    private func initWeightTextField() {
        weightTextField = UITextField()
        weightTextField.keyboardType = .NumberPad
        weightTextField.borderStyle = .RoundedRect
        
        self.addSubview(weightTextField)
        weightTextField.translatesAutoresizingMaskIntoConstraints = false
        let centerYCon = NSLayoutConstraint(item: weightTextField, attribute: .CenterY, relatedBy: .Equal, toItem: weightLabel, attribute: .CenterY, multiplier: 1, constant: 0)
        let leadingCon = NSLayoutConstraint(item: weightTextField, attribute: .Leading, relatedBy: .Equal, toItem: weightLabel, attribute: .Trailing, multiplier: 1, constant: Constants.WeightTextFieldLeadingGap)
        let widthCon = NSLayoutConstraint(item: weightTextField, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: Constants.WeightTextFieldWidth)
        self.addConstraints([centerYCon, leadingCon, widthCon])
    }
    
    private func initWeightUnitLabel() {
        weightUnitLabel = UILabel()
        weightUnitLabel.text = Constants.WeightUnitLabelUSText
        
        self.addSubview(weightUnitLabel)
        weightUnitLabel.translatesAutoresizingMaskIntoConstraints = false
        let centerYCon = NSLayoutConstraint(item: weightUnitLabel, attribute: .CenterY, relatedBy: .Equal, toItem: weightTextField, attribute: .CenterY, multiplier: 1, constant: 0)
        let leadingCon = NSLayoutConstraint(item: weightUnitLabel, attribute: .Leading, relatedBy: .Equal, toItem: weightTextField, attribute: .Trailing, multiplier: 1, constant: Constants.WeightUnitLabelLeadingGap)
        self.addConstraints([centerYCon, leadingCon])
    }
    
    // MARK: - Height part
    
    private func initHeightPart() {
        initHeightLabel()
        initFirstHeightTextField()
        initFirstHeightUnitLabel()
        initSecondHeightTextField()
        initSecondHeightUnitLabel()
    }
    
    private func initHeightLabel() {
        heightLabel = UILabel()
        heightLabel.text = Constants.HeightLabelText
        
        self.addSubview(heightLabel)
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        let topCon = NSLayoutConstraint(item: heightLabel, attribute: .Top, relatedBy: .Equal, toItem: weightLabel, attribute: .Bottom, multiplier: 1, constant: Constants.HeightLabelTopGap)
        let leadingCon = NSLayoutConstraint(item: heightLabel, attribute: .Leading, relatedBy: .Equal, toItem: weightLabel, attribute: .Leading, multiplier: 1, constant: 0)
        self.addConstraints([topCon, leadingCon])
    }
    
    private func initFirstHeightTextField() {
        firstHeightTextField = UITextField()
        firstHeightTextField.keyboardType = .NumberPad
        firstHeightTextField.borderStyle = .RoundedRect
        
        self.addSubview(firstHeightTextField)
        firstHeightTextField.translatesAutoresizingMaskIntoConstraints = false
        let centerYCon = NSLayoutConstraint(item: firstHeightTextField, attribute: .CenterY, relatedBy: .Equal, toItem: heightLabel, attribute: .CenterY, multiplier: 1, constant: 0)
        let leadingCon = NSLayoutConstraint(item: firstHeightTextField, attribute: .Leading, relatedBy: .Equal, toItem: weightTextField, attribute: .Leading, multiplier: 1, constant: 0)
        let widthCon = NSLayoutConstraint(item: firstHeightTextField, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: Constants.FirstHeightTextFieldWidth)
        self.addConstraints([centerYCon, leadingCon, widthCon])
    }
    
    private func initFirstHeightUnitLabel() {
        firstHeightUnitLabel = UILabel()
        firstHeightUnitLabel.text = Constants.FirstHeightUnitLabelUSText
        
        self.addSubview(firstHeightUnitLabel)
        firstHeightUnitLabel.translatesAutoresizingMaskIntoConstraints = false
        let centerYCon = NSLayoutConstraint(item: firstHeightUnitLabel, attribute: .CenterY, relatedBy: .Equal, toItem: firstHeightTextField, attribute: .CenterY, multiplier: 1, constant: 0)
        let leadingCon = NSLayoutConstraint(item: firstHeightUnitLabel, attribute: .Leading, relatedBy: .Equal, toItem: weightUnitLabel, attribute: .Leading, multiplier: 1, constant: 0)
        self.addConstraints([centerYCon, leadingCon])
    }
    
    private func initSecondHeightTextField() {
        secondHeightTextField = UITextField()
        secondHeightTextField.keyboardType = .NumberPad
        secondHeightTextField.borderStyle = .RoundedRect
        
        self.addSubview(secondHeightTextField)
        secondHeightTextField.translatesAutoresizingMaskIntoConstraints = false
        let centerYCon = NSLayoutConstraint(item: secondHeightTextField, attribute: .CenterY, relatedBy: .Equal, toItem: heightLabel, attribute: .CenterY, multiplier: 1, constant: 0)
        let leadingCon = NSLayoutConstraint(item: secondHeightTextField, attribute: .Leading, relatedBy: .Equal, toItem: firstHeightUnitLabel, attribute: .Trailing, multiplier: 1, constant: Constants.SecondHeightTextFieldLeadingCon)
        let widthCon = NSLayoutConstraint(item: secondHeightTextField, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: Constants.SecondHeightTextFieldWidth)
        self.addConstraints([centerYCon, leadingCon, widthCon])
    }
    
    private func initSecondHeightUnitLabel() {
        secondHeightUnitLabel = UILabel()
        secondHeightUnitLabel.text = Constants.SecondHeightUnitLabelUSText
        
        self.addSubview(secondHeightUnitLabel)
        secondHeightUnitLabel.translatesAutoresizingMaskIntoConstraints = false
        let centerYCon = NSLayoutConstraint(item: secondHeightUnitLabel, attribute: .CenterY, relatedBy: .Equal, toItem: firstHeightTextField, attribute: .CenterY, multiplier: 1, constant: 0)
        let leadingCon = NSLayoutConstraint(item: secondHeightUnitLabel, attribute: .Leading, relatedBy: .Equal, toItem: secondHeightTextField, attribute: .Trailing, multiplier: 1, constant: Constants.SecondHeightUnitLabelLeadingCon)
        self.addConstraints([centerYCon, leadingCon])
    }
    
    // MARK: - Age part
    
    private func initAgePart() {
        initAgeLabel()
        initAgeTextField()
    }
    
    private func initAgeLabel() {
        ageLabel = UILabel()
        ageLabel.text = Constants.AgeLabelText
        
        self.addSubview(ageLabel)
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        let topCon = NSLayoutConstraint(item: ageLabel, attribute: .Top, relatedBy: .Equal, toItem: heightLabel, attribute: .Bottom, multiplier: 1, constant: Constants.AgeLabelTopGap)
        let leadingCon = NSLayoutConstraint(item: ageLabel, attribute: .Leading, relatedBy: .Equal, toItem: heightLabel, attribute: .Leading, multiplier: 1, constant: 0)
        self.addConstraints([topCon, leadingCon])
    }
    
    private func initAgeTextField() {
        ageTextField = UITextField()
        ageTextField.keyboardType = .NumberPad
        ageTextField.borderStyle = .RoundedRect
        
        self.addSubview(ageTextField)
        ageTextField.translatesAutoresizingMaskIntoConstraints = false
        let centerYCon = NSLayoutConstraint(item: ageTextField, attribute: .CenterY, relatedBy: .Equal, toItem: ageLabel, attribute: .CenterY, multiplier: 1, constant: 0)
        let leadingCon = NSLayoutConstraint(item: ageTextField, attribute: .Leading, relatedBy: .Equal, toItem: firstHeightTextField, attribute: .Leading, multiplier: 1, constant: 0)
        let widthCon = NSLayoutConstraint(item: ageTextField, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: Constants.WeightTextFieldWidth)
        self.addConstraints([centerYCon, leadingCon, widthCon])
    }
    
    // MARK: - Activity level part
    
    private func initActivityLevelPart() {
        initActivityLevelLabel()
        initActivityLevelButton()
    }
    
    private func initActivityLevelLabel() {
        activityLevelLabel = UILabel()
        activityLevelLabel.text = Constants.ActivityLevelLabelText
        
        self.addSubview(activityLevelLabel)
        activityLevelLabel.translatesAutoresizingMaskIntoConstraints = false
        let topCon = NSLayoutConstraint(item: activityLevelLabel, attribute: .Top, relatedBy: .Equal, toItem: ageLabel, attribute: .Bottom, multiplier: 1, constant: Constants.ActivityLevelLabelTopGap)
        let leadingCon = NSLayoutConstraint(item: activityLevelLabel, attribute: .Leading, relatedBy: .Equal, toItem: ageLabel, attribute: .Leading, multiplier: 1, constant: 0)
        self.addConstraints([topCon, leadingCon])
    }
    
    private func initActivityLevelButton() {
        activityLevelButton = UIButton(type: UIButtonType.System)
        activityLevelButton.setTitle(Constants.ActivityLevels[0], forState: UIControlState.Normal)
        
        self.addSubview(activityLevelButton)
        activityLevelButton.translatesAutoresizingMaskIntoConstraints = false
        let centerYCon = NSLayoutConstraint(item: activityLevelButton, attribute: .CenterY, relatedBy: .Equal, toItem: activityLevelLabel, attribute: .CenterY, multiplier: 1, constant: 0)
        let leadingCon = NSLayoutConstraint(item: activityLevelButton, attribute: .Leading, relatedBy: .Equal, toItem: activityLevelLabel, attribute: .Trailing, multiplier: 1, constant: Constants.ActivityLevelButtonLeadingGap)
        let widthCon = NSLayoutConstraint(item: activityLevelButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: Constants.ActivityLevelButtonWidth)
        let heightCon = NSLayoutConstraint(item: activityLevelButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: Constants.ActivityLevelButtonHeight)
        self.addConstraints([centerYCon, leadingCon, widthCon, heightCon])
    }
    
    // MARK: - Constants
    
    struct Constants {
        static let BackgroundColor = UIColor.whiteColor()

        static let RegularGap = CGFloat(20)
        
        static let UsUnitLabelText = "US"
        static let I18nUnitLabelText = "Metric"
        static let UsUnitLabelTopGap = 2 * RegularGap
        static let UsUnitLabelTrailingGap = -RegularGap
        static let UsUnitSwitchTrailingGap = -RegularGap
        static let I18nUnitSwitchLeadingGap = RegularGap
        static let I18nUnitLabelLeadingGap = RegularGap
        
        static let FemaleLabelText = "Female"
        static let MaleLabelText = "Male"
        static let FemaleSwitchTopGap = RegularGap
        static let FemaleLabelLeadingGap = RegularGap
        static let MaleSwitchLeadingGap = RegularGap
        static let MaleLabelLeadingGap = RegularGap
        
        static let WeightLabelText = "Weight"
        static let WeightUnitLabelUSText = "lbs"
        static let WeightUnitLabelI18nText = "kg"
        static let WeightLabelTopGap = RegularGap
        static let WeightTextFieldLeadingGap = RegularGap
        static let WeightTextFieldWidth = 3 * RegularGap
        static let WeightUnitLabelLeadingGap = RegularGap
        
        static let HeightLabelText = "Height"
        static let FirstHeightUnitLabelUSText = "ft"
        static let FirstHeightUnitLabelMetricText = "cm"
        static let SecondHeightUnitLabelUSText = "in"
        static let HeightLabelTopGap = RegularGap
        static let FirstHeightTextFieldWidth = WeightTextFieldWidth
        static let SecondHeightTextFieldLeadingCon = RegularGap
        static let SecondHeightTextFieldWidth = WeightTextFieldWidth
        static let SecondHeightUnitLabelLeadingCon = RegularGap
        
        static let AgeLabelText = "Age"
        static let AgeLabelTopGap = RegularGap
        static let AgeTextFieldWidth = WeightTextFieldWidth

        static let ActivityLevelLabelText = "Activity Level"
        static let ActivityLevels = ["Sedentary", "Lightly Active", "Moderately Active", "Very Active", "Exetremely Active"]
        static let ActivityLevelLabelTopGap = RegularGap
        static let ActivityLevelButtonWidth = 8 * RegularGap
        static let ActivityLevelButtonHeight = RegularGap
        static let ActivityLevelButtonLeadingGap = RegularGap
    }
}
