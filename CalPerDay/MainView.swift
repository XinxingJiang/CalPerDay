//
//  MainView.swift
//  CalPerDay
//
//  Created by Xinxing Jiang on 2/15/16.
//  Copyright © 2016 jiang. All rights reserved.
//

import UIKit

class MainView: UIView {
    convenience init(mainController: MainController) {
        self.init()
        self.backgroundColor = Constants.BackgroundColor
        mainController.view.addSubview(self)
        
        // constraints
        self.translatesAutoresizingMaskIntoConstraints = false
        let heightCon = NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: mainController.view, attribute: .Height, multiplier: 1, constant: 0)
        let widthCon = NSLayoutConstraint(item: self, attribute: .Width, relatedBy: .Equal, toItem: mainController.view, attribute: .Width, multiplier: 1, constant: 0)
        mainController.view.addConstraints([heightCon, widthCon])
        
        // init subviews
        initSubviews()
    }
    
    private func initSubviews() {
        initUnit()
    }
    
    private func initUnit() {
        
    }
    
    // MARK: - Constants
    
    struct Constants {
        static let BackgroundColor = UIColor.whiteColor()
    }
}
