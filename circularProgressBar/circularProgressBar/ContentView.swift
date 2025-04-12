//
//  ContentView.swift
//  circularProgressBar
//
//  Created by Artem Chernousov on 12.04.2025.
//

import SwiftUI

struct ContentView: View {
    @State var firstLayerProgress: Double = 0
    @State var secondLayerProgress: Double = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                CircularProgressView(
                    firstLayerProgress: firstLayerProgress,
                    secondLayerProgress: secondLayerProgress
                )
                
                Text("\(firstLayerProgress * 100, specifier: "%.0f")")
                    .font(.largeTitle)
                    .bold()
            }
            .frame(maxWidth: 232, maxHeight: 232)
            
            Slider(value: $firstLayerProgress, in: 0...1)
                .padding()
            
            Spacer()
            
        }
    }
}

#Preview {
    ContentView()
}
