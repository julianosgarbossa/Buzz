//
//  NewsListDetailModel.swift
//  Buzz
//
//  Created by Juliano Sgarbossa on 04/07/25.
//

import Foundation

struct NewsListDetailModel {
    struct FetchNewsDetail {
        struct Request {
            let id: Int
        }
        struct Response {
            let article: Article?
        }
        struct ViewModel {
            struct DisplayedArticle {
                let title: String
                let author: String
                let description: String
                let content: String
                let url: URL
                let imageUrl: URL
                let publishedAt: String
            }
            let displayedArticle: DisplayedArticle?
        }
    }
}
