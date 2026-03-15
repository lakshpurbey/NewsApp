//
//  Article.swift
//  NewsApp
//
//  Created by Laxmipurbey on 15/03/26.
//

import Foundation

struct Article: Identifiable, Codable {
    var id: UUID = UUID()
    let title: String
    let description: String?
    let url: String
    let imageUrl: String?
    let publishedAt: String
}
