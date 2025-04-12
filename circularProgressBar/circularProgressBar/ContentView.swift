//
//  ContentView.swift
//  circularProgressBar
//
//  Created by Artem Chernousov on 12.04.2025.
//

import SwiftUI

struct ContentView: View {
    @State var timeCounter: Double = 0
    @State var workingProgress: Double = 0
    @State var breakCurrentTime: Double = 0
    @State var breakStartTime: Double = 0
    @State var isWorkStarted: Bool = false
    @State var isBreakStarted: Bool = false
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                CircularProgressView(
                    firstLayerProgress: workingProgress,
                    secondLayerProgressStart: breakStartTime,
                    secondLayerProgressCurrent: breakCurrentTime
                )
                
                Text("\(workingProgress * 100, specifier: "%.0f")")
                    .font(.largeTitle)
                    .bold()
            }
            .frame(maxWidth: 232, maxHeight: 232)
            
            buttons()
            
            Spacer()
            
        }
        .onReceive(timer) { input in
            if isWorkStarted {
                timeCounter += 1
                workingProgress = timeCounter / 100
            }

            if isBreakStarted {
                breakCurrentTime = timeCounter / 100
            }
        }
    }
    
    @ViewBuilder private func buttons() -> some View {
        VStack {
            Button("Start Work") {
                startWork()
            }
            .buttonStyle(.borderedProminent)
            
            HStack {
                Button("Start Break") {
                    startBreak()
                }
                .buttonStyle(.borderedProminent)
                
                Button("Stop Break") {
                    stopBreak()
                }
                .buttonStyle(.borderedProminent)
            }
            
            Button("Stop Work") {
                stopWork()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(.vertical, 20)
    }
    
    private func startWork() {
        isWorkStarted = true
    }
    
    private func startBreak() {
        breakStartTime = workingProgress
        isBreakStarted = true
    }
    
    private func stopBreak() {
        isBreakStarted = false
    }
    
    private func stopWork() {
        isWorkStarted = false
        isBreakStarted = false
    }
}

#Preview {
    ContentView()
}
