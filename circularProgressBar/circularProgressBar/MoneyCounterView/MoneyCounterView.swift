//
//  MoneyCounterView.swift
//  circularProgressBar
//
//  Created by Artem Chernousov on 12.04.2025.
//

import SwiftUI

struct MoneyCounterView: View {
    private enum Constants {
        static let minValue = 0
        static let maxValue = 9
        static let maxNumber: Int = 3
    }
    
    let value: Double
    
    @State private var number: Int = 0
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Text("$")
                .font(.largeTitle)
                .bold()
            
            NumberCounterView(value: geHundreeds())
            NumberCounterView(value: geTenth())
            NumberCounterView(value: getNumber())
            
            Text(".\(value.splitDecimal()[1])")
                .font(.largeTitle)
                .bold()
        }
    }
    
    private func getNumber() -> Int {
        let stringValue =  String(value.splitDecimal()[0])
        
        guard stringValue.count <= Constants.maxNumber else { return Constants.maxNumber }
        
        return Int(String(stringValue.last ?? "0")) ?? 0
    }
    
    private func geTenth() -> Int {
        let stringValue =  String(value.splitDecimal()[0].dropLast())
        
        guard stringValue.count <= Constants.maxNumber else { return Constants.maxNumber }
        
        return Int(String(stringValue.last ?? "0")) ?? 0
    }
    
    private func geHundreeds() -> Int {
        let stringValue =  String(value.splitDecimal()[0].dropLast(2))
        
        guard stringValue.count <= Constants.maxNumber else { return Constants.maxNumber }
        
        return Int(String(stringValue.last ?? "0")) ?? 0
    }
}


extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
}
