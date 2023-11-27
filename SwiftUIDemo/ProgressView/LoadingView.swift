//
//  LoadingView.swift
//  SwiftUIDemo
//
//  Created by Jackin on 2023/11/27.
//

import SwiftUI

struct LoadingView: View {
    
    var thickness: CGFloat = 20.0
    var width: CGFloat = 220.0
    
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            ZStack {
                //外环
                Circle()
                    .stroke(Color(.systemGray6), lineWidth: thickness)
                
                //内环
                RingShape(progress: 0.2, thickness: thickness)
                    .fill(Color.blue)
                    .rotationEffect(.degrees(self.isAnimating ? 360 : 0))
                    .animation(.easeInOut(duration: 1.2).repeatForever(autoreverses: false), value: self.isAnimating)
            }
            .frame(width: width, height: width, alignment: .center)
        }
        .onAppear {
            self.isAnimating = true
        }
        .onDisappear {
            self.isAnimating = false
        }
    }
}

#Preview {
    LoadingView()
}
