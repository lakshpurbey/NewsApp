//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Laxmipurbey on 15/03/26.
//

import SwiftUI

@main
struct NewsAppApp: App {
    var body: some Scene {
        WindowGroup {
            NewsListView(
                viewModel: makeNewsListViewModel()
            )
        }
    }
    
    private func makeNewsListViewModel() -> NewsListViewModel {

            let apiService = NewsAPIService()
            let repository = NewsRepository(service: apiService)
            let useCase = FetchNewsUseCase(repository: repository)

            return NewsListViewModel(fetchNewsUseCase: useCase)
        }

}
