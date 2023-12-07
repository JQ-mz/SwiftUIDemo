//
//  DataBindingViewModel.swift
//  SwiftUIDemo
//
//  Created by Jackin on 2023/12/7.
//

import Foundation

class DataBindingViewModel: ObservableObject {
    @Published var value = 0
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}
