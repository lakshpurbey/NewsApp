//
//  ArticleRowView.swift
//  NewsApp
//
//  Created by Laxmipurbey on 15/03/26.
//

import SwiftUI

struct ArticleRowView: View {

    let article: Article

    var body: some View {

        HStack {

            AsyncImage(url: URL(string: article.imageUrl ?? "")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80)
            .cornerRadius(8)

            VStack(alignment: .leading) {

                Text(article.title)
                    .font(.headline)

                Text(article.description ?? "")
                    .font(.subheadline)
                    .lineLimit(2)

            }
        }
    }
}
