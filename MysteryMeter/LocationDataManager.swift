//
//  Location.swift
//  MysteryMeter
//
//  Created by Erlend Tyrmi on 06/04/2023.
//  https://coledennis.medium.com/tutorial-connecting-core-location-to-a-swiftui-app-dc62563bd1de
//

import Foundation
import CoreLocation

class LocationDataManager : NSObject, ObservableObject, CLLocationManagerDelegate {
   var locationManager = CLLocationManager()

   override init() {
      super.init()
       locationManager.delegate = self
   }
    
    @Published var authorizationStatus: CLAuthorizationStatus?
    @Published var distanceToDestination: CLLocationDistance?
    @Published var latitude: CLLocationDegrees?
    @Published var longitude: CLLocationDegrees?

    var destination = CLLocation(latitude: 55.698035, longitude: 12.588923)

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            switch manager.authorizationStatus {
            case .authorizedWhenInUse:  // Location services are available.
                // Insert code here of what should happen when Location services are authorized
                authorizationStatus = .authorizedWhenInUse
                manager.startUpdatingLocation()
                break
                
            case .restricted, .denied:  // Location services currently unavailable.
                // Insert code here of what should happen when Location services are NOT authorized
                authorizationStatus = .restricted
                break
                
            case .notDetermined:        // Authorization not determined yet.
                authorizationStatus = .notDetermined
                manager.requestWhenInUseAuthorization()
                break
                
            default:
                break
            }
        }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            // Insert code to handle location updates
        distanceToDestination = manager.location?.distance(from: destination)
        latitude = manager.location?.coordinate.latitude
        longitude = manager.location?.coordinate.longitude
        
        // Debug print
        print("DEST")
        print(destination)
        print ("POS")
        print(manager.location)
        print("DIST")
        print(manager.location?.distance(from: destination))
        
        }
        
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("error: \(error.localizedDescription)")
        }
}
