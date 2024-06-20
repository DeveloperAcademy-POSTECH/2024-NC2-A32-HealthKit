//
//  CoreLocationManager.swift
//  NC2-RinZero Watch App
//
//  Created by Seo-Jooyoung on 6/21/24.
//

import Foundation
import CoreLocation

class CoreLocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    private var locationManager = CLLocationManager()
    private var previousLocation: CLLocation?
    @Published var totalDistanceMoved: Double = 0.0
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func startUpdatingLocationData() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        previousLocation = nil // Reset previous location
        totalDistanceMoved = 0.0 // Reset total distance
    }
    
    func stopUpdatingLocationData() {
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last else { return }
        
        if let previousLocation = previousLocation {
            let distance = newLocation.distance(from: previousLocation)
            totalDistanceMoved += distance
            totalDistanceMoved /= 1000
        }
        
        previousLocation = newLocation
    }
}
