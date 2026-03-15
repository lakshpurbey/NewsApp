//
//  NewsRepository.swift
//  NewsApp
//
//  Created by Laxmipurbey on 15/03/26.
//

protocol NewsRepositoryProtocol {
    func fetchNews(category: String, page: Int) async throws -> [Article]
}


final class NewsRepository: NewsRepositoryProtocol {

    private let service: NewsAPIService

    init(service: NewsAPIService) {
        self.service = service
    }

    func fetchNews(category: String, page: Int) async throws -> [Article] {
        try await service.fetchNews(category: category, page: page)
    }
}
