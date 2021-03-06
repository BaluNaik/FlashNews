//
//  FNEverythingCell.swift
//  FlashNews
//
//  Created by Balu Naik on 11/10/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import UIKit

protocol FNEverythingCellDelegate: class {
    func featchSearchTextNews(_ text: String)
}

class FNEverythingCell: UITableViewCell, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    weak var delegate: FNEverythingCellDelegate!

    override func awakeFromNib() {
        super.awakeFromNib()
        searchBar.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let _ = searchBar.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) {
            self.delegate.featchSearchTextNews(searchBar.text!)
            searchBar.text = ""
        }
    }

}
