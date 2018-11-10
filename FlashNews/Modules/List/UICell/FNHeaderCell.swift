//
//  FNHeaderCell.swift
//  FlashNews
//
//  Created by Balu Naik on 11/10/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import UIKit

protocol FNHeaderCellDelegate: class {
    func showCountryPicker()
    func showCategoryPicker()
}

class FNHeaderCell: UITableViewCell {


    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var viewCountry: UIView!
    @IBOutlet weak var viewCategory: UIView!
    @IBOutlet weak var bgVew: UIView!
    weak var delegate: FNHeaderCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.actionCountyChanged(_:)))
        self.lblCountry.addGestureRecognizer(tapGesture)
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(self.actionCategoryChanged(_:)))
        self.lblCategory.addGestureRecognizer(tapGesture1)
        setUpDefaultState()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updatesCategory(_ text: String) {
        self.lblCategory.text = text
    }
    
    func updatesCountry(_ countryCode: String, _ country:String) {
        self.lblCountry.text = "\(self.emojiFlag(countryCode.uppercased())) \(country)"
    }
    
    
    //MARK: Private Methods
    
    fileprivate func setUpDefaultState() {
        self.lblCountry.text = "\(self.emojiFlag("us".uppercased())) United States"
        self.lblCategory.text = "General"
    }
    
    fileprivate func emojiFlag(_ countryCode: String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in countryCode.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
    
    @objc func actionCountyChanged(_ sender: Any) {
        self.delegate.showCountryPicker()
    }
    
    @objc func actionCategoryChanged(_ sender: Any) {
        self.delegate.showCategoryPicker()
    }
    
}
