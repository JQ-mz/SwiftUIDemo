//
//  DataBindingView.swift
//  SwiftUIDemo
//
//  Created by Jackin on 2023/12/7.
//

import SwiftUI

struct DataBindingView: View {
    @State private var str: String = ""
    @State private var isShowText: Bool = true
    @ObservedObject var viewModel = DataBindingViewModel()
    
    var body: some View {
        VStack (alignment: .center, spacing: 20) {
            TextField("Placeholder", text: $str).textFieldStyle(.roundedBorder).border(.black)
            Text("\(str)")
            
            if (isShowText) {
                Text("点击下方按钮隐藏")
            } else {
                Text("点击下方按钮显示").hidden()
            }
            BtnView(isShowText: $isShowText)
            
            Text("自动更新10s：\(viewModel.value)")
            
            EnvView().environmentObject(viewModel)
            Env1View().environmentObject(viewModel)
        }.padding()
    }
}

struct BtnView: View {
    @Binding var isShowText: Bool
    
    var body: some View {
        Button {
            isShowText.toggle()
        } label: {
            Text(isShowText ? "点击隐藏" : "点击显示")
        }
    }
}

struct EnvView: View {
    @EnvironmentObject var viewModel: DataBindingViewModel
    
    var body: some View {
        Text("EnvView value: \(viewModel.value)")
    }
}

struct Env1View: View {
    @EnvironmentObject var viewModel: DataBindingViewModel
    
    var body: some View {
        Text("Env1View value: \(viewModel.value)")
    }
}

#Preview {
    DataBindingView()
}
