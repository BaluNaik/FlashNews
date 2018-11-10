//
//  SplashViewController.swift
//  FlashNews
//
//  Created by Balu Naik on 11/9/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.setUpListScreen()
        }
    }
    
    //MARK: Private Method
    
    fileprivate func setUpListScreen() {
        let assesmble = FNListAssembly()
        let navigationController = UINavigationController(rootViewController: assesmble.assemblyModule())
        UIApplication.shared.keyWindow?.rootViewController = navigationController
    }
}

