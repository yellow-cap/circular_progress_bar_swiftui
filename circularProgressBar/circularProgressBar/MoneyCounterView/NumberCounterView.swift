//
//  MoneyCounterView.swift
//  circularProgressBar
//
//  Created by Artem Chernousov on 12.04.2025.
//

import SwiftUI

struct NumberCounterView: View {
    private enum Constants {
        static let minValue = 0
        static let maxValue = 9
        static let numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    }
    
    let value: Int
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(Constants.numbers, id: \.self) { number in
                        Text(String(number))
                            .font(.largeTitle)
                            .bold()
                            .id(number)
                    }
                }
            }
            .frame(maxWidth: 25, maxHeight: 50)
            .scrollDisabled(true)
            .onChange(of: value) {
                if value == 0 {
                    proxy.scrollTo(value)
                } else {
                    withAnimation(.easeIn) {
                        proxy.scrollTo(value)
                    }
                }
            }
        }
    }
}
