//
//  HealthKitManager.swift
//  NC2-RinZero Watch App
//
//  Created by Seo-Jooyoung on 6/20/24.
//

import Foundation
import HealthKit

class HealthKitManager: NSObject, ObservableObject, HKWorkoutSessionDelegate, HKLiveWorkoutBuilderDelegate {
    func workoutBuilder(_ workoutBuilder: HKLiveWorkoutBuilder, didCollectDataOf collectedTypes: Set<HKSampleType>) {
        print("1")
    }
    
    func workoutBuilderDidCollectEvent(_ workoutBuilder: HKLiveWorkoutBuilder) {
        print("2")
    }
    
    func workoutSession(_ workoutSession: HKWorkoutSession, didChangeTo toState: HKWorkoutSessionState, from fromState: HKWorkoutSessionState, date: Date) {
        print("3")
    }
    
    func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error: any Error) {
        print("4")
    }
    
    // MARK: - 변수
    let healthStore = HKHealthStore()
    var workoutSession: HKWorkoutSession?
    var workoutBuilder: HKLiveWorkoutBuilder?
    
    let runningSpeedQuantity = HKUnit(from: "m/s")
    let distanceQuantity = HKUnit(from: .kilometer)
    
    @Published var currentRunningSpeed: Int = 0
    @Published var currentDistanceWalkingRunning: Double = 0
    
    private var timer: Timer?
    private var startDate: Date?
    private var totalDistanceWalkingRunning: Double = 0.0
    
    private var runningSpeedQuery: HKAnchoredObjectQuery?
    private var distanceQuery: HKAnchoredObjectQuery?
    
    // MARK: - 권한 받아오기
    func requestAuthorization () {
//        let typesToWrite: Set = [
//            HKObjectType.workoutType()
//        ]
        
        let typesToRead: Set = [
            HKQuantityType(.runningSpeed),
            HKQuantityType(.distanceWalkingRunning)
        ]
        
        healthStore.requestAuthorization(toShare: [], read: typesToRead) { (success, error) in
            if !success {
                print("HealthKit authorization failed: \(String(describing: error))")
            }
        }
    }
    
    // MARK: - 러닝 Start
    func startRunningWorkout(workoutType: HKWorkoutActivityType) {
        let configuration = HKWorkoutConfiguration()
        let startDate = Date()

        configuration.activityType = .running
        configuration.locationType = .outdoor
        
        do {
            workoutSession = try HKWorkoutSession(healthStore: healthStore, configuration: configuration)
            workoutBuilder = workoutSession?.associatedWorkoutBuilder()
            
            workoutBuilder?.dataSource = HKLiveWorkoutDataSource(healthStore: healthStore,
                                                                 workoutConfiguration: configuration)
            
            workoutSession?.delegate = self
            workoutBuilder?.delegate = self
            
            workoutSession?.startActivity(with: startDate)
            workoutBuilder?.beginCollection(withStart: startDate) { (success, error) in
                if let error = error {
                    print("Failed to begin collection: \(error.localizedDescription)")
                }
            }
            
            startRunningSpeedQuery()
            startDistanceQuery()
        } catch {
            print("Failed to start workout session: \(error.localizedDescription)")
            return
        }
    }
    
    // MARK: - 러닝 End
    func endRunningWorkout() {
        workoutSession?.end()
        workoutBuilder?.endCollection(withEnd: Date()) { (success, error) in
            self.workoutBuilder?.finishWorkout { (workout, error) in
                if let error = error {
                    print("Failed to finish workout: \(error.localizedDescription)")
                }
            }
        }
        
        stopQueries()
    }
    
    private func stopQueries() {
        if let runningSpeedQuery = runningSpeedQuery {
            healthStore.stop(runningSpeedQuery)
        }
        
        if let distanceQuery = distanceQuery {
            healthStore.stop(distanceQuery)
        }
    }
    
    
    @Published var running = false
    
    func togglePause() {
        if running == true {
            self.pause()
        } else {
            resume()
        }
    }

    // MARK: - 러닝 Stop
    func pause() {
        workoutSession?.pause()
    }
    
    // MARK: - 러닝 Restart
    func resume() {
        workoutSession?.resume()
    }
    
    func startRunningSpeedQuery() {
        guard let sampleType = HKObjectType.quantityType(forIdentifier: .runningSpeed) else { return }
        
        let predicate = HKQuery.predicateForSamples(withStart: Date(), end: nil, options: .strictStartDate)
        
        runningSpeedQuery = HKAnchoredObjectQuery(type: sampleType, predicate: predicate, anchor: nil, limit: HKObjectQueryNoLimit) { [weak self] query, samples, deletedObjects, queryAnchor, error in
            self?.processRunningSpeed(samples as? [HKQuantitySample] ?? [])
        }
        
        runningSpeedQuery?.updateHandler = { [weak self] query, samples, deletedObjects, queryAnchor, error in
            self?.processRunningSpeed(samples as? [HKQuantitySample] ?? [])
        }
        
        if let runningSpeedQuery = runningSpeedQuery {
            healthStore.execute(runningSpeedQuery)
        }
    }
    
    func startDistanceQuery() {
        guard let sampleType = HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning) else { return }
        
        let predicate = HKQuery.predicateForSamples(withStart: Date(), end: nil, options: .strictStartDate)
        
        distanceQuery = HKAnchoredObjectQuery(type: sampleType, predicate: predicate, anchor: nil, limit: HKObjectQueryNoLimit) { [weak self] query, samples, deletedObjects, queryAnchor, error in
            self?.processDistance(samples as? [HKQuantitySample] ?? [])
        }
        
        distanceQuery?.updateHandler = { [weak self] query, samples, deletedObjects, queryAnchor, error in
            self?.processDistance(samples as? [HKQuantitySample] ?? [])
        }
        
        if let distanceQuery = distanceQuery {
            healthStore.execute(distanceQuery)
        }
    }
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] _ in
            self?.hkQuery(quantityTypeIdentifier: .runningSpeed)
        }
    }
    
    public func hkQuery(quantityTypeIdentifier: HKQuantityTypeIdentifier) {
        let devicePredicate = HKQuery.predicateForObjects(from: [HKDevice.local()])
        let updateHandler:(HKAnchoredObjectQuery, [HKSample]?, [HKDeletedObject]?, HKQueryAnchor?, Error?) -> Void = {
            query, samples, deletedObjects, queryAnchor, error in
            
            guard let samples = samples as? [HKQuantitySample] else {
                return
            }
            
            if (quantityTypeIdentifier == .runningSpeed) {
                self.processRunningSpeed(samples)
            }
        }
        
        let query = HKAnchoredObjectQuery(type: HKQuantityType.quantityType(forIdentifier: quantityTypeIdentifier)!, predicate: devicePredicate, anchor: nil, limit: HKObjectQueryNoLimit, resultsHandler: updateHandler)
        
        query.updateHandler = updateHandler
        
        healthStore.execute(query)
    }
    
    private func processRunningSpeed(_ samples: [HKQuantitySample]) {
        var lastRunningSpeed = 0.0
        
        for sample in samples {
            lastRunningSpeed = sample.quantity.doubleValue(for: runningSpeedQuantity)
            
            DispatchQueue.main.async {
                self.currentRunningSpeed = Int(lastRunningSpeed)
            }
        }
    }
    
    private func processDistance(_ samples: [HKQuantitySample]) {
        self.startDate = Date() // 현재 시점을 시작 시점으로 설정
        
        for sample in samples {
            guard let startDate = self.startDate, sample.startDate >= startDate else {
                continue // 시작 시점 이후의 데이터만 처리
            }
            
            let distance = sample.quantity.doubleValue(for: distanceQuantity)
            totalDistanceWalkingRunning += distance
            
            DispatchQueue.main.async {
                self.currentDistanceWalkingRunning = self.totalDistanceWalkingRunning
            }
        }
    }
}
