//
//  ContentView.swift
//  circularProgressBar
//
//  Created by Artem Chernousov on 12.04.2025.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @State private var timeCounter: Double = 0
    @State private var breakCounter: Int = 0
    @State private var workingProgress: Double = 0
    @State private var breakCurrentTime: Double = 0
    @State private var breakStartTime: Double = 0
    @State private var isWorkStarted: Bool = false
    @State private var isBreakStarted: Bool = false
    @State private var breakTimes: [CircularProgressBarLayer] = []
    @State private var moneyValue: Double = 0
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                CircularProgressView(
                    primaryLayer: CircularProgressBarLayer(
                        id: 0,
                        start: 0,
                        current: workingProgress
                    ),
                    secondaryLayers: breakTimes,
                )

                MoneyCounterView(value: moneyValue)
            }
            .frame(maxWidth: 232, maxHeight: 232)
            
            buttons()
            
            log()
            
            Spacer()
            
        }
        .onReceive(timer) { input in
            if isWorkStarted {
                timeCounter += 1
                workingProgress = timeCounter / 100
                
                updateMoneyValue()
            }

            if isBreakStarted {
                updateBreak()
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
    
    @ViewBuilder private func log() -> some View {
        VStack(alignment: .leading) {
            Text("Working progress: \(workingProgress.fractionDigitsRounded(to: 2))")
            Text("Break start time: \(breakStartTime.fractionDigitsRounded(to: 2))")
            Text("Break current time: \(breakCurrentTime.fractionDigitsRounded(to: 2))")
        }
        .padding(.vertical, 20)
    }
    
    private func startWork() {
        isWorkStarted = true
    }
    
    private func startBreak() {
        breakCounter += 1
        breakStartTime = workingProgress
        isBreakStarted = true
        
        breakTimes.append(
            CircularProgressBarLayer(
                id: breakCounter,
                start: breakStartTime,
                current: timeCounter / 100
            )
        )
    }
    
    private func updateBreak() {
        breakTimes[breakCounter - 1] = CircularProgressBarLayer(
            id: breakCounter,
            start: breakStartTime,
            current: timeCounter / 100
        )
        
        breakCurrentTime = timeCounter / 100
    }
    
    private func stopBreak() {
        isBreakStarted = false
    }
    
    private func stopWork() {
        isWorkStarted = false
        isBreakStarted = false
    }
    
    private func updateMoneyValue() {
        guard !isBreakStarted else { return }
        
        moneyValue = (workingProgress - breakTimes.reduce(into: 0, { $0 += ($1.current - $1.start) })) * 100
    }
}

#Preview {
    ContentView()
}
