//
//  Date+Extensions.swift
//  grpc-swift-ios-example
//
//  Created by Leo Ho on 2023/12/22.
//

import Foundation

extension Date {
    
    func formatted(dateFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.string(from: self)
    }
}
