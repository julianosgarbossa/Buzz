//
//  NewsListModel.swift
//  Buzz
//
//  Created by Juliano Sgarbossa on 03/07/25.
//

import Foundation

struct NewsListModel {
    
    struct FetchNews {
        struct Request {
            
        }
        
        struct Response {
            let articles: [Article]
        }
        
        struct ViewModel {
            struct DisplayedArticle {
                let id: Int
                let title: String
                let description: String
                let author: String
                let publishedAt: String
                let imageUrl: URL
            }
            let displayedArticles: [DisplayedArticle]
        }
    }
}
