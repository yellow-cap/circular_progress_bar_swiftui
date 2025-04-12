//
//  CircularProgressBarView.swift
//  circularProgressBar
//
//  Created by Artem Chernousov on 12.04.2025.
//

import SwiftUI

struct CircularProgressView: View {
    let firstLayerProgress: Double
    let secondLayerProgress: Double
    
    var body: some View {
        ZStack {
            baseLayer()
            
            fistLayer()
            
            secondLayer()
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
    private func secondLayer() -> some View {
        Circle()
            .trim(from: secondLayerProgress, to: firstLayerProgress)
            .stroke(
                Color(Constants.progressBarSecondLayerColor),
                style: StrokeStyle(
                    lineWidth: Constants.progressBarSecondLayerWidth,
                    lineCap: .round
                )
            )
            .shadow(color: .black.opacity(0.5), radius: 2)
            .rotationEffect(.degrees(-90))
            .animation(.easeOut, value: firstLayerProgress)
    }
}

#Preview {
    CircularProgressView(firstLayerProgress: 0.8, secondLayerProgress: 0.6)
        .frame(maxWidth: 232, maxHeight: 232)
}
