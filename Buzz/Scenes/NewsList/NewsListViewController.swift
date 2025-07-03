//
//  NewsListViewController.swift
//  Buzz
//
//  Created by Juliano Sgarbossa on 02/07/25.
//

import UIKit

class NewsListViewController: UIViewController {
    
    private let interactor = NewsListInterector()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        self.interactor.loadNews(request: NewsListModel.FetchNews.Request())
    }
}

