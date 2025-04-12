//
//  CircularProgressBarView.swift
//  circularProgressBar
//
//  Created by Artem Chernousov on 12.04.2025.
//

import SwiftUI

struct CircularProgressView: View {
    let firstLayerProgress: Double
    let secondLayerProgressStart: Double?
    let secondLayerProgressCurrent: Double?
    
    var body: some View {
        ZStack {
            baseLayer()
            
            fistLayer()
            
            secondLayer(
                start: secondLayerProgressStart ?? 0,
                current: secondLayerProgressCurrent ?? 0
            )
        }
    }
    
    @ViewBuilder
    private func baseLayer() -> some View {
        Circle()
            .stroke(
                Color(Constants.progressBarBaseLayerColor),
                lineWidth: Constants.progressBarBaseLayerWidth
            )
    }
    
    @ViewBuilder
    private func fistLayer() -> some View {
        Circle()
            .trim(from: 0, to: firstLayerProgress)
            .stroke(
                Color(Constants.progressBarFistLayerColor),
                style: StrokeStyle(
                    lineWidth: Constants.progressBarFistLayerWidth,
                    lineCap: .round
                )
            )
            .rotationEffect(.degrees(-90))
            .animation(.easeOut, value: firstLayerProgress)
    }
    
    @ViewBuilder
    private func secondLayer(start: Double, current: Double) -> some View {
        Circle()
            .trim(from: start, to: current)
            .stroke(
                Color(Constants.progressBarSecondLayerColor),
                style: StrokeStyle(
                    lineWidth: Constants.progressBarSecondLayerWidth,
                    lineCap: .round
                )
            )
            .shadow(color: .black.opacity(0.5), radius: 2)
            .rotationEffect(.degrees(-90))
            .animation(.easeOut, value: current)
    }
}

#Preview {
    CircularProgressView(
        firstLayerProgress: 0.8,
        secondLayerProgressStart: 0.3,
        secondLayerProgressCurrent: 0.5
    )
    .frame(maxWidth: 232, maxHeight: 232)
}
