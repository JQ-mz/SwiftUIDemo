//
//  ArticleTabBarView.swift
//  SwiftUIDemo
//
//  Created by Jackin on 2023/12/7.
//

import SwiftUI

struct ArticleTabBarView: View {
    var body: some View {
        TabView {
            ArticleListView(articles: techArticles)
                .tabItem {
                    Image(systemName: "desktopcomputer")
                    Text("Tech")
                }
            ArticleListView(articles: businessArticles)
                .tabItem {
                    Image(systemName: "dollarsign.circle")
                    Text("Science")
                }
            ArticleListView(articles: sportArticles)
                .tabItem {
                    Image(systemName: "sportscourt")
                    Text("Design")
                }
        }.navigationTitle("Articles")
    }
}

#Preview {
    ArticleTabBarView()
}
