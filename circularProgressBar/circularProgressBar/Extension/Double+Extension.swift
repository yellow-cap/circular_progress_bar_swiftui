//
//  Double+Extension.swift
//  circularProgressBar
//
//  Created by Artem Chernousov on 12.04.2025.
//

extension Double {
    func splitDecimal() -> [String.SubSequence] {
        String(self).split(separator: ".")
    }
}
