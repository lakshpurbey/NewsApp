//
//  BookmarkView.swift
//  NewsApp
//
//  Created by Laxmipurbey on 15/03/26.
//

import SwiftUI

struct BookmarkView: View {

    @StateObject private var viewModel = BookmarkViewModel()

    var body: some View {

        NavigationStack {

            Group {

                if viewModel.bookmarks.isEmpty {

                    VStack(spacing: 20) {

                        Image(systemName: "bookmark.slash")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)

                        Text("No Bookmarks Yet")
                            .font(.title3)
                            .fontWeight(.medium)

                        Text("Articles you bookmark will appear here.")
                            .font(.subheadline)
                            .foregroundColor(.gray)

                    }

                } else {

                    List {

                        ForEach(viewModel.bookmarks) { article in

                            NavigationLink {

                                NewsDetailView(article: article)

                            } label: {

                                ArticleRowView(article: article)

                            }
                        }
                        .onDelete { indexSet in

                            indexSet.map { viewModel.bookmarks[$0] }
                                .forEach { article in
                                    viewModel.removeBookmark(article)
                                }
                        }
                    }
                }
            }
            .navigationTitle("Bookmarks")
        }
        .onAppear {
            viewModel.loadBookmarks()
        }
    }
}
