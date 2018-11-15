//
//  FNDetailsViewController.swift
//  FlashNews
//
//  Created by Balu Naik on 11/12/18.
//  Copyright © 2018 Balu Naik. All rights reserved.
//

import UIKit
import SDWebImage

class FNDetailsViewController: FNBaseViewController, FNDetailsPresenterOutput {
    
    var presenter : FNDetailsPresenterInput!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblArticleTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblUrl: UILabel!
    @IBOutlet weak var textViewContent: UITextView!
    @IBOutlet weak var lblDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.openLink))
        lblUrl.isUserInteractionEnabled = true
        lblUrl.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addBackButton()
        setUpUI()
    }
    
    func setUpUI() {
        if let url = presenter.getImageUrl() {
            imageView.sd_setShowActivityIndicatorView(true)
            imageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "picture"))
        }
        lblArticleTitle.text = presenter.getArticleTitle()
        lblAuthor.text = presenter.getArticleAuthor()
        if let date = presenter.getPublishedDate() {
            lblDate.text = FNUtility.ConvertDateFormater(comingDate: date)
        }
        self.textViewContent.text = presenter.getArticleContent()
        
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        let underlineAttributedString = NSAttributedString(string: presenter.getArticleUrl() ?? "", attributes: underlineAttribute)
        self.lblUrl.attributedText = underlineAttributedString
    }
    
    @objc fileprivate func openLink() {
        if let url = URL(string: presenter.getArticleUrl() ?? "" ) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
}
