//
//  MoneyCounterView.swift
//  circularProgressBar
//
//  Created by Artem Chernousov on 12.04.2025.
//

import SwiftUI

struct MoneyCounterView: View {
    let value: String
    
    var body: some View {
        Text(value)
            .font(.largeTitle)
            .bold()
    }
}
