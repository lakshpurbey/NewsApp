//
//  BookmarkViewModel.swift
//  NewsApp
//
//  Created by Laxmipurbey on 16/03/26.
//

import Foundation
import Combine

@MainActor
class BookmarkViewModel: ObservableObject {

    @Published var bookmarks: [Article] = []

    private let storage = BookmarkStorage()

    func loadBookmarks() {
        bookmarks = storage.load()
    }

    func removeBookmark(_ article: Article) {

        bookmarks.removeAll { $0.url == article.url }

        storage.save(bookmarks)
    }
}
