//
//  NewsListDetailPresenter.swift
//  Buzz
//
//  Created by Juliano Sgarbossa on 04/07/25.
//

import Foundation

protocol NewsListDetailPresentationLogic {
    func presentFethedNewsById(response: NewsListDetailModel.FetchNewsDetail.Response)
    func presentError(error: Error)
}

class NewsListDetailPresenter: NewsListDetailPresentationLogic {
    func presentFethedNewsById(response: NewsListDetailModel.FetchNewsDetail.Response) {
        let article = response.article
        guard let article else { return }
        let displayedArticle = NewsListDetailModel.FetchNewsDetail.ViewModel.DisplayedArticle(title: article.title,
                                                                                              author: article.author,
                                                                                              description: article.description,
                                                                                              content: article.content,
                                                                                              url: article.url,
                                                                                              imageUrl: article.urlToImage,
                                                                                              publishedAt: formatDate(date: article.publishedAt))
        
        let viewModel = NewsListDetailModel.FetchNewsDetail.ViewModel(displayedArticle: displayedArticle)
        
    }
    
    func presentError(error: any Error) {
        
    }
    
    private func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.dateFormat = "d 'de' MMMM 'de' yyyy"
        return formatter.string(from: date)
    }
}
