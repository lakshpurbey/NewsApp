//
//  APIClient.swift
//  NewsApp
//
//  Created by Laxmipurbey on 15/03/26.
//

import Foundation

final class APIClient {

    func request<T: Decodable>(url: URL) async throws -> T {

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let http = response as? HTTPURLResponse,
              http.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(T.self, from: data)
    }
}

struct NewsResponse: Codable {
    let articles: [ArticleDTO]
}

struct ArticleDTO: Codable {
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String

    func toDomain() -> Article {
        Article(
            title: title,
            description: description,
            url: url,
            imageUrl: urlToImage,
            publishedAt: publishedAt
        )
    }
}
