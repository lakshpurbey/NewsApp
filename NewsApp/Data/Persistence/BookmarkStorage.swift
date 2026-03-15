//
//  BookmarkStorage.swift
//  NewsApp
//
//  Created by Laxmipurbey on 15/03/26.
//

import Foundation

final class BookmarkStorage {

    private let key = "bookmarked_articles"

    func save(_ articles: [Article]) {
        let data = try? JSONEncoder().encode(articles)
        UserDefaults.standard.set(data, forKey: key)
    }

    func load() -> [Article] {
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let articles = try? JSONDecoder().decode([Article].self, from: data)
        else {
            return []
        }

        return articles
    }
}
