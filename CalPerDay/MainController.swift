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
    
    // MARK: - VC life cycle
    
    override func loadView() {
        super.loadView()
        mainView = MainView(mainController: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.usUnitSwitch.addTarget(self, action: Selector("usUnitSelected"), forControlEvents: UIControlEvents.TouchUpInside)
        mainView.i18nUnitSwitch.addTarget(self, action: Selector("i18nUnitSelected"), forControlEvents: UIControlEvents.TouchUpInside)
        mainView.femaleSwitch.addTarget(self, action: Selector("femaleSelected"), forControlEvents: UIControlEvents.TouchUpInside)
        mainView.maleSwitch.addTarget(self, action: Selector("maleSelected"), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    // MARK: - Action
    
    func usUnitSelected() {
        mainView.i18nUnitSwitch.on = !mainView.usUnitSwitch.on
    }
    
    func i18nUnitSelected() {
        mainView.usUnitSwitch.on = !mainView.i18nUnitSwitch.on
    }
    
    func femaleSelected() {
        mainView.maleSwitch.on = !mainView.femaleSwitch.on
    }
    
    func maleSelected() {
        mainView.femaleSwitch.on = !mainView.maleSwitch.on
    }
}

