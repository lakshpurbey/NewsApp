//
//  NewsListViewModel.swift
//  NewsApp
//
//  Created by Laxmipurbey on 15/03/26.
//

import Combine

@MainActor
final class NewsListViewModel: ObservableObject {

    @Published var articles: [Article] = []
    @Published var category: String = "technology"

    private let fetchNewsUseCase: FetchNewsUseCase

    private var page = 1
    private var isLoading = false

    init(fetchNewsUseCase: FetchNewsUseCase) {
        self.fetchNewsUseCase = fetchNewsUseCase
    }

    func fetchNews() async {

        guard !isLoading else { return }

        isLoading = true

        do {
            let newArticles = try await fetchNewsUseCase.execute(
                category: category,
                page: page
            )

            articles.append(contentsOf: newArticles)
            page += 1

        } catch {
            print(error)
        }

        isLoading = false
    }

    func refresh(category: String) {
        self.category = category
        self.page = 1
        self.articles = []
        Task { await fetchNews() }
    }
}
