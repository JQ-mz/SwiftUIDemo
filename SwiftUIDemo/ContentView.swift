//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Jackin on 2023/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var weightText: String = ""
    @State private var heightText: String = ""
    @State private var bmi: Double = 0
    @State private var classification: String = ""
    @State private var show: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Text("BMI Calculator:").font(.largeTitle)
            TextField("Enter Weight (in kilograms)", text: $weightText).textFieldStyle(.roundedBorder).border(.black)
            TextField("Enter Height (in meters)", text: $heightText).textFieldStyle(.roundedBorder).border(.black)
            Button {
                print("button taped")
                let weight = Double(self.weightText)!
                let height = Double(self.heightText)!
                self.bmi = weight / (height * height)
                if self.bmi < 18.5 {
                    self.classification = "Underweight"
                } else if self.bmi < 24.9 {
                    self.classification = "Healthy weight"
                } else if self.bmi < 29.9 {
                    self.classification = "Overweight"
                } else {
                    self.classification = "Obese"
                }
            } label: {
                Text("Calculate BMI").padding().foregroundColor(.white).background(Color.blue)
            }.foregroundColor(.green)
            Text("BMI: **\(self.bmi, specifier: "%.1f")**, \(classification)").font(.title).padding()
            Link("Visit Our Site", destination: URL(string: "https://www.meizu.com/")!)
            Button("Show Alert") {
                show.toggle()
            }.alert(isPresented: $show) {
                Alert.init(title: Text("title"), message: Text("message"), dismissButton: .cancel())
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone SE (2nd generation)")
    }
}
