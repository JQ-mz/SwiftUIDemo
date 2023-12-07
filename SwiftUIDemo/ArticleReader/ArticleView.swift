//
//  ArticleView.swift
//  SwiftUIDemo
//
//  Created by Jackin on 2023/12/7.
//

import SwiftUI

struct ArticleView: View {
    let article: Article
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(article.title).font(.title)
            Text(article.description).font(.headline)
            Spacer()
        }.padding()
    }
}

#Preview {
    ArticleView(article: Article(title: "Test Title", description: "Test Desc", type: "Test Type"))
}
