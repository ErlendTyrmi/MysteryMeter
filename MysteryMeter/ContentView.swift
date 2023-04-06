//
//  ContentView.swift
//  MysteryMeter
//
//  Created by Erlend Tyrmi on 06/04/2023.
//

import CoreLocation
import SwiftUI

struct ContentView: View {
    @StateObject var locationDataManager = LocationDataManager()
    var body: some View {
        
        VStack {
            switch locationDataManager.locationManager.authorizationStatus {
            case .authorizedWhenInUse:  // Location services are available.
                // Insert code here of what should happen when Location services are authorized
                
                Spacer()
                
                Text("Your current location is:")
                Text("Latitude: \(locationDataManager.locationManager.location?.coordinate.latitude.description ?? "Error loading")")
                Text("Longitude: \(locationDataManager.locationManager.location?.coordinate.longitude.description ?? "Error loading")")
                
                Spacer()
                
                Text("Distance: \(locationDataManager.distanceToDestination?.description ?? "Error loading")")
                
                Spacer()
                
            case .restricted, .denied:  // Location services currently unavailable.
                // Insert code here of what should happen when Location services are NOT authorized
                Text("Current location data was restricted or denied.")
            case .notDetermined:        // Authorization not determined yet.
                Text("Finding your location...")
                ProgressView()
            default:
                ProgressView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
