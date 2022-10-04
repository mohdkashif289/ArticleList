//
//  Article.swift
//  ArticleList
//
//  Created by Kashif Rizvi on 10/05/22.
//

import Foundation

struct Article: Codable {
    let title: String
    let description: String
    let url: String
    let urlToImage: String
}

struct ArticleResponse: Codable {
    let articles: [Article]
}
