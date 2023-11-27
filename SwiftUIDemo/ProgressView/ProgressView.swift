//
//  ProgressView.swift
//  SwiftUIDemo
//
//  Created by Jackin on 2023/11/27.
//

import SwiftUI

struct ProgressView: View {
    
    var thickness: CGFloat = 20.0
    var width: CGFloat = 220.0
    
    @State var progress = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                //外环
                Circle()
                    .stroke(Color(.systemGray6), lineWidth: thickness)
                
                //内环
                RingShape(progress: progress, thickness: thickness)
                    .fill(Color.blue)
            }
            .frame(width: width, height: width, alignment: .center)
            .animation(.easeInOut(duration: 1.0), value: progress)
            
            HStack {
                Group {
                    Text("0%").font(.system(.headline, design: .rounded))
                        .onTapGesture {
                            self.progress = 0.0
                        }
                    Text("50%").font(.system(.headline, design: .rounded))
                        .onTapGesture {
                            self.progress = 0.5
                        }
                    Text("100%").font(.system(.headline, design: .rounded))
                        .onTapGesture {
                            self.progress = 1.0
                        }
                }
                .padding()
                .background(Color(.systemGray6)).clipShape(RoundedRectangle(cornerRadius: 15.0, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)).padding()
            }
            .padding()
        }
    }
}

struct RingShape: Shape {
    
    var progress: Double = 0.0
    var thickness: CGFloat = 20.0
    var startAngle: Double = -90.0
    
    var animatableData: Double {
        get { progress }
        set { progress = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.width / 2.0, y: rect.height / 2.0), radius: min(rect.width, rect.height) / 2.0, startAngle: .degrees(startAngle), endAngle: .degrees(360*progress + startAngle), clockwise: false)
        
        return path.strokedPath(.init(lineWidth: thickness, lineCap: .round))
    }
}

#Preview {
    ProgressView()
}
