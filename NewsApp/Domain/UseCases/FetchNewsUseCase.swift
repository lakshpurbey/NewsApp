//
//  FetchNewsUseCase.swift
//  NewsApp
//
//  Created by Laxmipurbey on 15/03/26.
//

import Foundation

final class FetchNewsUseCase {

    private let repository: NewsRepositoryProtocol

    init(repository: NewsRepositoryProtocol) {
        self.repository = repository
    }

    func execute(category: String, page: Int) async throws -> [Article] {
        try await repository.fetchNews(category: category, page: page)
    }
}
