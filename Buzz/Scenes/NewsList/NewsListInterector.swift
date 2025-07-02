//
//  NewsListInterector.swift
//  Buzz
//
//  Created by Juliano Sgarbossa on 02/07/25.
//

import Foundation

class NewsListInterector {
    private var worker: NewsAPIWorker
    private var articles: [Article] = []
    
    init(worker: NewsAPIWorker = NewsAPIWorker(networkingService: URLSessionNetworking())) {
        self.worker = worker
    }
    
    func loadNews() {
        worker.fetchNews { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let articles):
                    self.articles = articles
                    print(articles)
                case .failure(let error):
                    print("Ocorreu um erro ao obter a lista de notícias: \(error.localizedDescription)")
                }
            }
        }
    }
}
