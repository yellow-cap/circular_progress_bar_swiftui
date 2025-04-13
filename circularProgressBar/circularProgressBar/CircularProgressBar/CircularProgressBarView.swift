//
//  CircularProgressBarView.swift
//  circularProgressBar
//
//  Created by Artem Chernousov on 12.04.2025.
//

import SwiftUI
struct CircularProgressView: View {
    let primaryLayer: CircularProgressBarLayer
    let secondaryLayers: [CircularProgressBarLayer]
    
    var body: some View {
        ZStack {
            baseLayer()
            
            fistLayer()
            
            ForEach(secondaryLayers, id: \.id) { layer in
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
                Constants.progressBarBaseLayerColor,
                lineWidth: Constants.progressBarBaseLayerWidth
            )
    }
    
    @ViewBuilder
    private func fistLayer() -> some View {
        Circle()
            .trim(from: 0, to: primaryLayer.current)
            .stroke(
                Constants.progressBarFistLayerColor,
                style: StrokeStyle(
                    lineWidth: Constants.progressBarFistLayerWidth,
                    lineCap: .round
                )
            )
            .rotationEffect(.degrees(-90))
            .animation(.easeOut, value: primaryLayer.current)
    }
    
    @ViewBuilder
    private func secondLayer(start: Double, current: Double) -> some View {
        Circle()
            .trim(from: start, to: current)
            .stroke(
                Constants.progressBarSecondLayerColor,
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
        primaryLayer: CircularProgressBarLayer(id: 0, start: 0, current: 0.8),
        secondaryLayers: [
            CircularProgressBarLayer(id: 1, start: 0.2, current: 0.3),
            CircularProgressBarLayer(id: 2, start: 0.7, current: 0.9)
        ]
    )
    .frame(maxWidth: 232, maxHeight: 232)
}
