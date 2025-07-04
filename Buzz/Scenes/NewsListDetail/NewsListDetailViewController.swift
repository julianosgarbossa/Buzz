//
//  NewsListDetailViewController.swift
//  Buzz
//
//  Created by Juliano Sgarbossa on 04/07/25.
//

import UIKit

class NewsListDetailViewController: UIViewController {
    
    var articleId: Int
    
    init(articleId: Int) {
        self.articleId = articleId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
}
