//
//  NewsListView.swift
//  NewsApp
//
//  Created by Laxmipurbey on 15/03/26.
//

import SwiftUI

struct NewsListView: View {

    @StateObject var viewModel: NewsListViewModel

    var body: some View {

        NavigationStack {

            List(viewModel.articles) { article in

                ArticleRowView(article: article)
                    .onAppear {

                        if article.id == viewModel.articles.last?.id {
                            Task {
                                await viewModel.fetchNews()
                            }
                        }

                    }
            }
            .navigationTitle("News")
        }
        .task {
            await viewModel.fetchNews()
        }
    }
}
