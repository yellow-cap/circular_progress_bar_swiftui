//
//  MoneyCounterView.swift
//  circularProgressBar
//
//  Created by Artem Chernousov on 12.04.2025.
//

import SwiftUI

struct MoneyCounterView: View {
    let value: Double
    
    var body: some View {
        Text(String(value.fractionDigitsRounded(to: 1)))
            .font(.largeTitle)
            .bold()
    }
}
