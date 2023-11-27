//
//  AppStoreSwiftUIView.swift
//  SwiftUIDemo
//
//  Created by Jackin on 2023/11/22.
//

import SwiftUI

struct AppStoreSwiftUIView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    NavigationAvatar()
                    RecommendGames()
                    Divider().padding()
                    EditorsPickGames()
                }
            }
            .navigationTitle("游戏")
        }
    }
}

struct NavigationAvatar: View {
    var body: some View {
        Divider().padding(EdgeInsets.init(top: 20, leading: 20, bottom: 0, trailing: 20))
        .overlay {
            Button(action: {
                print("update")
            }, label: {
                AsyncImage(url: URL.init(string: "https://www.polestar.cn/w3-assets/apple-touch-icon.png"), content: { img in
                    img.resizable()
                }, placeholder: {
                    ProgressView()
                }).frame(width: 50, height: 50).cornerRadius(25)
                    .overlay {
                        Text("83").frame(width: 32, height: 20).background(.red).cornerRadius(10).foregroundColor(.white).padding(EdgeInsets.init(top: -30, leading: 30, bottom: 0, trailing: 0))
                    }.padding(EdgeInsets.init(top: -64, leading: 300, bottom: 0, trailing: 0))
            })
        }
    }
}

struct RecommendGames: View {
    var items = [
        "https://www.polestar.cn/dato-assets/11286/1699889141-01-polestar-4-overview-overview-intro-no-star-cn-d.png?q=80&dpr=2&w=1920",
        "https://www.polestar.cn/dato-assets/11286/1692695353-02-polestar-4-overview-stats-d.png?q=80&dpr=2&w=1920"
    ]
    
    var body: some View {
        TabView {
           ForEach(items, id: \.self) { item in
               VStack {
                   HStack {
                       Text("重磅更新").foregroundColor(.blue).fontWeight(.bold)
                       Spacer()
                   }
                   HStack {
                       Text("地下城堡3：魂之诗").font(.title)
                       Spacer()
                   }
                   HStack {
                       Text("新地图“废械阵”上线").font(.title2).foregroundColor(.gray)
                       Spacer()
                   }
                   AsyncImage(url: URL.init(string: item)) { img in
                       img.resizable()
                   } placeholder: {
                       ProgressView()
                   }
                   .frame(width: UIScreen.main.bounds.width - 40, height: 220)
                   .cornerRadius(10)
                   .overlay {
                       VStack {
                           Spacer()
                           HStack {
                               AsyncImage(url: URL.init(string: "https://www.polestar.cn/w3-assets/apple-touch-icon.png")) { img in
                                   img.resizable()
                               } placeholder: {
                                   ProgressView()
                               }
                               .frame(width: 50, height: 50).cornerRadius(12)
                               VStack {
                                   HStack {
                                       Text("地下城堡3：魂之诗").foregroundColor(.white).font(.title3)
                                       Spacer()
                                   }
                                   HStack {
                                       Text("暗黑文字地牢探险").foregroundColor(.gray)
                                       Spacer()
                                   }
                               }
                               Spacer()
                               VStack {
                                   Button("获取") {
                                       print("get")
                                   }.foregroundColor(.white).font(Font.system(.title2).bold()).frame(width: 94, height: 40).background(.gray.opacity(0.8)).cornerRadius(20)
                                   Text("App内购买").foregroundColor(.gray).font(.footnote)
                               }.padding(.top, 15)
                           }
                           .padding(EdgeInsets.init(top: 0, leading: 16, bottom: 6, trailing: 16))
                           .background(LinearGradient(colors: [.black.opacity(0.5), .clear], startPoint: .bottom, endPoint: .top)).cornerRadius(12)
                       }
                   }
               }.padding(20)
           }
       }
        .frame(width: UIScreen.main.bounds.width, height: 320)
       .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct EditorsPickGames: View {
    var items = [
        "https://www.polestar.cn/w3-assets/apple-touch-icon.png",
        "https://www.polestar.cn/w3-assets/apple-touch-icon.png",
        "https://www.polestar.cn/w3-assets/apple-touch-icon.png"
    ]
    
    var body: some View {
        VStack {
           HStack {
               Text("我们都在玩").font(.title).bold()
               Spacer()
               Button("查看全部") {
                   print("all")
               }.font(.title2)
           }
           HStack {
               Text("探索本周游戏热点").foregroundColor(.gray).font(.title2)
               Spacer()
           }
       }.padding(EdgeInsets.init(top: 0, leading: 20, bottom: 0, trailing: 20))
           
       TabView {
           ForEach(items, id: \.self) { item in
               List(0..<3) {_ in
                   HStack {
                       AsyncImage(url: URL.init(string: item)) { img in
                           img.resizable()
                       } placeholder: {
                           ProgressView()
                       }
                       .frame(width: 68, height: 68).cornerRadius(16)
                       VStack {
                           HStack {
                               Text("地下城堡3：魂之诗").font(.title3)
                               Spacer()
                           }
                           HStack {
                               Text("暗黑文字地牢探险").foregroundColor(.gray)
                               Spacer()
                           }
                       }
                       Spacer()
                       VStack {
                           Button("获取") {
                               print("get")
                           }.foregroundColor(.blue).font(Font.system(.title2).bold()).frame(width: 94, height: 40).background(.gray.opacity(0.2)).cornerRadius(20)
                           Text("App内购买").foregroundColor(.gray).font(.footnote)
                       }
                   }
               }.listStyle(InsetListStyle())//.listRowSeparator(.hidden)
           }
       }
       .frame(width: UIScreen.main.bounds.width, height: 270)
       .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

#Preview {
    AppStoreSwiftUIView()
}
