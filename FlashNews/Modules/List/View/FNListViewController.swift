//
//  FNListViewController.swift
//  FlashNews
//
//  Created by Balu Naik on 11/9/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import UIKit

enum pickerType {
    case country
    case category
}

class FNListViewController: FNBaseViewController, FNListPresenterOutput, UITableViewDelegate, UITableViewDataSource, FNHeaderCellDelegate, UIPickerViewDataSource, UIPickerViewDelegate, FNEverythingCellDelegate {
    var presenter : FNListPresenterInput!
    var headerCell :FNHeaderCell!
    var selectedPickerType : pickerType!
    var selectedCountry = "United States"
    var selectedCountryCode = "us"
    var selectedCategory = "general"
    var searchText = "bitcoin"
    
    
    @IBOutlet weak var tbleView: UITableView!
    @IBOutlet weak var segmentNewsType: UISegmentedControl!
    @IBOutlet weak var viewForPicker: UIView!
    @IBOutlet weak var pickerview: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbleView.register(UINib(nibName: "FNEverythingCell", bundle: nil), forCellReuseIdentifier: "AllCell")
        tbleView.register(UINib(nibName: "FNHeaderCell", bundle: nil), forCellReuseIdentifier: "HeaderCell")
        tbleView.register(UINib(nibName: "FNTableCell", bundle: nil), forCellReuseIdentifier: "Cell")
        self.tbleView.backgroundView = nil
        self.tbleView.backgroundColor = UIColor.clear
        self.viewForPicker.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "NEWS"
        self.presenter.feachHadLines(self.selectedCountryCode, self.selectedCategory)
    }
    
    @IBAction func actionNewsTypeChanged(_ sender: Any) {
        self.presenter.resetArticleList()
        if self.selectedPickerType == pickerType.country {
            self.getHeadLines()
        } else {
            self.getAllNews()
        }
    }
    
    @IBAction func actionOnBarCancel(_ sender: Any) {
        self.showHidePickerView(true)
    }
    
    @IBAction func actionOnBarDone(_ sender: Any) {
        self.showHidePickerView(true)
        self.getHeadLines()
    }
    
    
    //MARK: FNListPresenterOutput
    
    func showLoaderView(_ status: Bool) {
        self.showLoader(status)
    }
    
    func showErrorView(_ message: String) {
        self.showError(message)
    }
    
    
    //MARK: Private Methods
    
    fileprivate func getHeadLines() {
        self.presenter.feachHadLines(self.selectedCountryCode, self.selectedCategory)
    }
    
    fileprivate func getAllNews() {
        self.presenter.feachAllNews(searchText)
    }
    
    fileprivate func showHidePickerView(_ show: Bool) {
        self.pickerview.reloadComponent(0)
        UIView.animate(withDuration: 0.2) {
            self.viewForPicker.isHidden = show
        }
    }
    
    
    //MARK: UITableViewDataSource and UITableViewDelegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.presenter.getArticleCount() + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            
            return 1
        } else {
            
            return self.presenter.getArticleCount() == 0 ? 0 : 1;
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if segmentNewsType.selectedSegmentIndex == 0 {
                self.headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! FNHeaderCell
                self.headerCell.delegate = self
                
                return self.headerCell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "AllCell", for: indexPath) as! FNEverythingCell
                cell.delegate = self
                
                return cell
            }
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FNTableCell
            if let obj = self.presenter.getArticalAtIndex(indexPath.section - 1) {
                cell.setArticle(obj)
            }
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            
            return 50.0
        } else {
            
            return 90.0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 5.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        
        return headerView
    }
    
    
    //MARK: FNHeaderCellDelegate
    
    func showCountryPicker() {
        self.selectedPickerType = pickerType.country
        self.showHidePickerView(false)
    }
    
    func showCategoryPicker() {
        self.selectedPickerType = pickerType.category
        self.showHidePickerView(false)
    }
    
    func updateContent() {
        self.tbleView.reloadData()
    }
    
    
    //MARK: FNEverythingCellDelegate
    
    func featchSearchTextNews(_ text: String) {
        self.searchText = text
        self.getAllNews()
    }
    
    
    //MARK: UIPickerViewDataSource and Delegate
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return (selectedPickerType == pickerType.country) ? self.presenter.getCountryCount() : self.presenter.getCategoryCount()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return (selectedPickerType == pickerType.country) ? self.presenter.getCountryTitle(row) : self.presenter.getCategoryTitle(row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if selectedPickerType == pickerType.country {
            self.selectedCountry =  self.presenter.getCountryTitle(row)
            self.selectedCountryCode = self.presenter.getCountryCode(row)
        } else {
            self.selectedCategory = self.presenter.getCategoryTitle(row)
        }
    }
    
}