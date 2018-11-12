//
//  FNBaseViewController.swift
//  FlashNews
//
//  Created by Balu Naik on 11/9/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import UIKit
import SVProgressHUD

class FNBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func pushViewController(_ controller: UIViewController, _ animated: Bool ) {
        self.navigationController?.pushViewController(controller, animated: animated)
    }
    
    func dismissViewController(_ animated: Bool) {
        self.navigationController?.popViewController(animated: animated)
    }
    
    func showError(_ message: String) {
        let alertController = UIAlertController(title: "FlashNews", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func goBack() {
        self.dismissViewController(true)
    }
    
    func addBackButton() {
        let backButton = UIBarButtonItem(image: UIImage(named:"back"), style: .plain, target: self, action:#selector(goBack))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    func showLoader(_ status: Bool) {
        if status {
            SVProgressHUD.setDefaultStyle(.light)
            SVProgressHUD.setDefaultMaskType(.gradient)
            SVProgressHUD.setDefaultAnimationType(.native)
            SVProgressHUD.show(withStatus: "Loading..")
        } else {
            SVProgressHUD.dismiss()
        }
    }

}
