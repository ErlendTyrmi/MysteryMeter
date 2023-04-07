//
//  ContentView.swift
//  MysteryMeter
//
//  Created by Erlend Tyrmi on 06/04/2023.
//

import CoreLocation
import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    @StateObject var storyManager = StoryManager()
    
    var body: some View {
        
        VStack {
            switch locationManager.locationManager.authorizationStatus {
            case .authorizedWhenInUse:  // Location services are available.
                // Insert code here of what should happen when Location services are authorized
                VStack{
                    MessageView(sender: storyManager.currentChapter?.sender, message: storyManager.currentChapter?.content)
                        .padding()
                        .background(Color.black)
                        .opacity(0.7)
                    Spacer()
                }.background(
                        AsyncImage(url: URL(string: storyManager.currentChapter!.imageUrl)) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            ProgressView()
                        }
                )
                .padding()
              
                VStack{
                    Text("Latitude: \(locationManager.locationManager.location?.coordinate.latitude.description ?? "Error loading")")
                    Text("Longitude: \(locationManager.locationManager.location?.coordinate.longitude.description ?? "Error loading")")
                    Text("Distance: \(locationManager.distanceToDestination?.description ?? "Error loading")")
                }.padding()
                
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
