//
//  HealthStore.swift
//  StepsStat
//
//  Created by ANDREY VORONTSOV on 22.01.2021.
//

import Foundation
import HealthKit

protocol HealthStoreProtocol {
    func calculateSteps(completion: @escaping (HKStatisticsCollection?) -> Void)
}

class HealthStore: HealthStoreProtocol {
    
    private var healthStore: HKHealthStore?
    
    private var query: HKStatisticsCollectionQuery?
    
    private let stepType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        }
    }
    
    func calculateSteps(completion: @escaping (HKStatisticsCollection?) -> Void) {
        let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())
        let anchorDate = Date.mondayAt12AM()
        let daily = DateComponents(day: 1)
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictStartDate)
        query = HKStatisticsCollectionQuery(quantityType: stepType, quantitySamplePredicate: predicate, options: [.cumulativeSum], anchorDate: anchorDate, intervalComponents: daily)
        query?.initialResultsHandler = { query, statistics, error in
            completion(statistics)
        }
        if let healthStore = healthStore, let query = query {
            healthStore.execute(query)
        }
    }
    
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        guard let healthStore = self.healthStore else { return completion(false) }
        healthStore.requestAuthorization(toShare: [], read: [stepType]) { (success, error) in
            completion(success)
        }
    }
}
