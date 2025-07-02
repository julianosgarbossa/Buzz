//
//  Article.swift
//  Buzz
//
//  Created by Juliano Sgarbossa on 02/07/25.
//

import Foundation

struct Article: Codable, Identifiable {
    let id: Int
    let author: String
    let title: String
    let description: String
    let url: URL
    let urlToImage: URL
    let publishedAT: Date
    let content: String
}
