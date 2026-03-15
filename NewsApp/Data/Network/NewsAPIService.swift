//
//  NewsAPIService.swift
//  NewsApp
//
//  Created by Laxmipurbey on 15/03/26.
//

import Foundation

final class NewsAPIService {

    private let client = APIClient()

    func fetchNews(category: String, page: Int) async throws -> [Article] {

        let urlString =
        "\(APIConstants.baseURL)?country=us&category=\(category)&page=\(page)&apiKey=\(APIConstants.apiKey)"

        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let response: NewsResponse = try await client.request(url: url)

        return response.articles.map { $0.toDomain() }
    }
}
