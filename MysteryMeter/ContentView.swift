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
    
    var body: some View {
        
        VStack {
            switch locationDataManager.locationManager.authorizationStatus {
            case .authorizedWhenInUse:  // Location services are available.
                // Insert code here of what should happen when Location services are authorized
                
                if storyDataManager.currentChapter != nil {
                    VStack{
                        MessageView(sender: storyDataManager.currentChapter?.sender, message: storyDataManager.currentChapter?.content)
                            .padding()
                            .background(Color.black)
                            .opacity(0.7)
                        Spacer()
                    }.background(
                        AsyncImage(url: URL(string: storyDataManager.currentChapter!.imageUrl)) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {
                            ProgressView()
                        }
                    )
                    .padding()
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
