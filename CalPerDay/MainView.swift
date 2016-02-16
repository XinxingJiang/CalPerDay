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
    
    // MARK: - Constants
    
    struct Constants {
        static let BackgroundColor = UIColor.whiteColor()

        static let UsUnitLabelText = "US"
        static let I18nUnitLabelText = "Metric"
        static let UsUnitLabelTopGap = CGFloat(20)
        static let UsUnitLabelTrailingGap = CGFloat(-20)
        static let UsUnitSwitchTrailingGap = CGFloat(-20)
        static let I18nUnitSwitchLeadingGap = CGFloat(20)
        static let I18nUnitLabelLeadingGap = CGFloat(20)
        
        static let FemaleLabelText = "Female"
        static let MaleLabelText = "Male"
        static let FemaleSwitchTopGap = CGFloat(20)
        static let FemaleLabelLeadingGap = CGFloat(20)
        static let MaleSwitchLeadingGap = CGFloat(20)
        static let MaleLabelLeadingGap = CGFloat(20)
    }
}
