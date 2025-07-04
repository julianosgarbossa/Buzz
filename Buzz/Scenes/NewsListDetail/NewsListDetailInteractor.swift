//
//  NewsListDetailInteractor.swift
//  Buzz
//
//  Created by Juliano Sgarbossa on 04/07/25.
//

import Foundation

protocol NewsListDetailBusinessLogic {
    func loadNewsFromId(articleId: Int)
}

protocol NewsListDetailDataStore {
    var article: Article? { get set }
}

class NewsListDetailInteractor: NewsListDetailBusinessLogic, NewsListDetailDataStore {
    var article: Article?
    private var worker: NewsAPIWorker
    
    init(worker: NewsAPIWorker = NewsAPIWorker(networkingService: URLSessionNetworking())) {
        self.worker = worker
    }
    
    func loadNewsFromId(articleId: Int) {
        worker.fetchNewsById(articleId: articleId) { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let article):
                    self.article = article
                    print(article)
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
}
