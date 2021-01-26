//
//  Step.swift
//  StepsStat
//
//  Created by ANDREY VORONTSOV on 22.01.2021.
//

import Foundation

struct Step {
    let id = UUID()
    let step: Int
    let date: Date
}

extension Step: Hashable {
    static func ==(lhs: Step, rhs: Step) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
