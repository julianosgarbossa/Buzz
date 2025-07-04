//
//  NewsListRouter.swift
//  Buzz
//
//  Created by Juliano Sgarbossa on 02/07/25.
//

import UIKit

protocol NewsListRoutingLogic {
    var viewContoller: NewsListViewController? { get set }
    func routeToNewsDetail(articleId: Int)
}

class NewsListRouter: NewsListRoutingLogic {
    
    static func createInicialViewController() -> UIViewController {
        let newsListViewController = NewsListViewController()
        let navigationController = UINavigationController(rootViewController: newsListViewController)
        return navigationController
    }
    
    var viewContoller: NewsListViewController?
    
    func routeToNewsDetail(articleId: Int) {
        let newsListDetailViewController = NewsListDetailViewController(articleId: articleId)
        viewContoller?.navigationController?.pushViewController(newsListDetailViewController, animated: true)
    }
}
