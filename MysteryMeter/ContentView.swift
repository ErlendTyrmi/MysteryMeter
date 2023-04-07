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
    @StateObject var storyDataManager = StoryDataManager()
    
    func increment(){
        storyDataManager.increment()
        
        let chapter = storyDataManager.currentChapter
        
        if chapter != nil && chapter!.longitude != 0 {
            locationDataManager.setDestination(latitude: chapter!.latitude, longitude: chapter!.longitude)
        } else {
            locationDataManager.setDestination(latitude: locationDataManager.latitude ?? 0, longitude: locationDataManager.longitude ?? 0)
        }
    }
    
    var body: some View {
        
        VStack {
            switch locationDataManager.locationManager.authorizationStatus {
            case .authorizedWhenInUse:  // Location services are available.
                // Insert code here of what should happen when Location services are authorized
                
                StoryView(storyDataManager: storyDataManager)
              
                
                // TODO: Load first storypoint
                if locationDataManager.distanceToDestination != nil &&
                    locationDataManager.distanceToDestination! > 0 {
                    
                    Button(action: increment) {
                        Text("NExT CLUe")
                            .fontWeight(.black)
                            .frame(maxWidth: .infinity)
                            .padding(
                            ).foregroundColor(Color.white)
                    }
                    .background(Color.green)
                }
                
                DashboardView(
                    locationDataManager: locationDataManager
                )
                
            case .restricted, .denied:  // Location services currently unavailable.
                // Insert code here of what should happen when Location services are NOT authorized
                Text("Current location data was restricted or denied.")
            case .notDetermined:        // Authorization not determined yet.
                Text("Finding your location...")
                ProgressView()
            default:
                ProgressView()
            }
        }.preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
