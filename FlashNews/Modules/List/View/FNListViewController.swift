//
//  FNListViewController.swift
//  FlashNews
//
//  Created by Balu Naik on 11/9/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import UIKit

class FNListViewController: FNBaseViewController, FNListPresenterOutput {
    var presenter : FNListPresenterInput!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getHeadLines()
        self.getAllNews()
    }
    
    //MARK: Private Methods
    
    fileprivate func getHeadLines() {
        self.presenter.feachHadLines("ae", "general")
    }
    
    fileprivate func getAllNews() {
        self.presenter.feachAllNews("bitcoin")
    }
    
}
