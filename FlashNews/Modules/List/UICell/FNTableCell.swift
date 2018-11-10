//
//  FNTableCell.swift
//  FlashNews
//
//  Created by Balu Naik on 11/10/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import UIKit

class FNTableCell: UITableViewCell {

    @IBOutlet weak var lblsource: UILabel!
    @IBOutlet weak var lblpublishedDate: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpDefaultSate() {
        self.lblsource.text = ""
        self.lblpublishedDate.text = ""
        self.lblTitle.text = ""
        self.lblAuthor.text = ""
    }
    
    func setArticle(_ article: FNArticle) {
        if let source = article.source?.name {
            self.lblsource.text = source
        }
        if let date = article.publishedAt {
            self.lblpublishedDate.text = FNUtility.ConvertDateFormater(comingDate: date)
        }
        if let title = article.title {
            self.lblTitle.text = title
        }
        if let aut = article.author {
            self.lblAuthor.text = aut
        }
    }
    
}
