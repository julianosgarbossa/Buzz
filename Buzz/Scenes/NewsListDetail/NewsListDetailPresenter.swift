//
//  NewsListDetailPresenter.swift
//  Buzz
//
//  Created by Juliano Sgarbossa on 04/07/25.
//

import Foundation

protocol NewsListDetailPresentationLogic {
    func presentFethedNewsById()
    func presentError(error: Error)
}

class NewsListDetailPresenter: NewsListDetailPresentationLogic {
    func presentFethedNewsById() {
        
    }
    
    func presentError(error: any Error) {
        
    }
}
