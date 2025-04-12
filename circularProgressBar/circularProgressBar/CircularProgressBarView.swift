//
//  CircularProgressBarView.swift
//  circularProgressBar
//
//  Created by Artem Chernousov on 12.04.2025.
//

import SwiftUI

struct CircularProgressBarLayer {
    let id: Int
    let start: Double
    let current: Double
}

struct CircularProgressView: View {
    let primaryLayerProgress: Double
    let secondaryLayersProgress: [CircularProgressBarLayer]
    
    var body: some View {
        ZStack {
            baseLayer()
            
            fistLayer()
            
            ForEach(secondaryLayersProgress, id: \.id) { layer in
                secondLayer(
                    start: layer.start,
                    current: layer.current
                )
            }
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
            .trim(from: 0, to: primaryLayerProgress)
            .stroke(
                Color(Constants.progressBarFistLayerColor),
                style: StrokeStyle(
                    lineWidth: Constants.progressBarFistLayerWidth,
                    lineCap: .round
                )
            )
            .rotationEffect(.degrees(-90))
            .animation(.easeOut, value: primaryLayerProgress)
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
        primaryLayerProgress: 0.8,
        secondaryLayersProgress: [
            CircularProgressBarLayer(id: 1, start: 0.2, current: 0.3),
            CircularProgressBarLayer(id: 2, start: 0.7, current: 0.9)
        ]
    )
    .frame(maxWidth: 232, maxHeight: 232)
}
