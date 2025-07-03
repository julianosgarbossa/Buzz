//
//  NewsListInterector.swift
//  Buzz
//
//  Created by Juliano Sgarbossa on 02/07/25.
//

import Foundation

protocol NewsListBusinessLogic {
    func loadNews(request: NewsListModel.FetchNews.Request)
}

protocol NewsListDataStore {
    var articles: [Article] { get set }
}

class NewsListInterector: NewsListBusinessLogic, NewsListDataStore {
    private var worker: NewsAPIWorker
    var articles: [Article] = []
    var presenter: NewsListPresentationLogic?
    
    init(worker: NewsAPIWorker = NewsAPIWorker(networkingService: URLSessionNetworking())) {
        self.worker = worker
    }
    
    func loadNews(request: NewsListModel.FetchNews.Request) {
        worker.fetchNews { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let articles):
                    self.articles = articles
                    let response = NewsListModel.FetchNews.Response(articles: articles)
                    self.presenter?.presentFetchedNews(response: response)
                    print(response)
                case .failure(let error):
                    print("Ocorreu um erro ao obter a lista de notícias: \(error.localizedDescription)")
                    self.presenter?.presentError(error: error)
                }
            }
        }
    }
}
