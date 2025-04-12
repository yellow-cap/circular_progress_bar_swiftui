//
//  MoneyCounterView.swift
//  circularProgressBar
//
//  Created by Artem Chernousov on 12.04.2025.
//

import SwiftUI

struct MoneyCounterView: View {
    let value: Int
    
    var body: some View {
        Text(String(value))
            .font(.largeTitle)
            .bold()
    }
}
