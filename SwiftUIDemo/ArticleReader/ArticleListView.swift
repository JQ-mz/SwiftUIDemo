//
//  ArticleListView.swift
//  SwiftUIDemo
//
//  Created by Jackin on 2023/12/7.
//

import SwiftUI

struct ArticleListView: View {
    let articles: [Article]
    
    var body: some View {
        #if os(macOS)
        return content.frame(minWidth: 400, minHeight: 600)
        #else
        return content
        #endif
    }
    
    @ViewBuilder
    private var content: some View {
        List(articles) { article in
            NavigationLink(destination: ArticleView(article: article)) {
                ArticleView(article: article)
            }
        }.navigationTitle("\(articles.first?.type ?? "")")
    }
}
