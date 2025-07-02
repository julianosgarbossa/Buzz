//
//  NewsListRouter.swift
//  Buzz
//
//  Created by Juliano Sgarbossa on 02/07/25.
//

import UIKit

class NewsListRouter {
    static func createInicialViewController() -> UIViewController {
        let newsListViewController = NewsListViewController()
        let navigationController = UINavigationController(rootViewController: newsListViewController)
        return navigationController
    }
}
