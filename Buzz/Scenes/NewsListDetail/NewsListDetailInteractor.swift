//
//  NewsListDetailInteractor.swift
//  Buzz
//
//  Created by Juliano Sgarbossa on 04/07/25.
//

import Foundation

protocol NewsListDetailBusinessLogic {
    func loadNewsFromId(request: NewsListDetailModel.FetchNewsDetail.Request)
}

protocol NewsListDetailDataStore {
    var article: Article? { get set }
}

class NewsListDetailInteractor: NewsListDetailBusinessLogic, NewsListDetailDataStore {
    var article: Article?
    private var worker: NewsAPIWorker
    var presenter: NewsListDetailPresentationLogic?
    
    init(worker: NewsAPIWorker = NewsAPIWorker(networkingService: URLSessionNetworking())) {
        self.worker = worker
    }
    
    func loadNewsFromId(request: NewsListDetailModel.FetchNewsDetail.Request) {
        worker.fetchNewsById(articleId: request.id) { [weak self] result in
            guard let self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let article):
                    self.article = article
                    let article = NewsListDetailModel.FetchNewsDetail.Response(article: article)
                    self.presenter?.presentFethedNewsById(response: article)
                case .failure(let error):
                    self.presenter?.presentError(error: error)
                }
            }
        }
    }
}
