//
//  NewsDetailView.swift
//  NewsApp
//
//  Created by Laxmipurbey on 15/03/26.
//

import SwiftUI

struct NewsDetailView: View {

    let article: Article
    
    @State private var isBookmarked = false
    private let storage = BookmarkStorage()

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: 16) {

                if let imageUrl = article.imageUrl,
                   let url = URL(string: imageUrl) {

                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 250)
                    .clipped()
                }

                Text(article.title)
                    .font(.title2)
                    .fontWeight(.bold)

                if let description = article.description {
                    Text(description)
                        .font(.body)
                }

                Text("Published: \(article.publishedAt)")
                    .font(.caption)
                    .foregroundColor(.gray)

                Link("Read Full Article", destination: URL(string: article.url)!)
                    .foregroundColor(.blue)
                    .padding(.top)
                
                Button {

                    var bookmarks = storage.load()
                    bookmarks.append(article)
                    storage.save(bookmarks)

                    isBookmarked = true

                } label: {

                    Label("Bookmark", systemImage: "bookmark")

                }
                .buttonStyle(.borderedProminent)

            }
            .padding()
          
        }
        .navigationTitle("Article")
        .navigationBarTitleDisplayMode(.inline)
    }
}
