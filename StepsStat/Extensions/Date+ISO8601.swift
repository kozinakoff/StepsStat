//
//  Date+ISO8601.swift
//  StepsStat
//
//  Created by ANDREY VORONTSOV on 22.01.2021.
//

import Foundation

extension Date {
    static func mondayAt12AM() -> Date {
        return Calendar(identifier: .iso8601).date(from: Calendar(identifier: .iso8601).dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date()))!
    }
}
