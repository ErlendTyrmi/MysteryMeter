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
        updateDestination(chapter: chapter)
    }
    
    func updateDestination(chapter: Chapter?){
        if chapter != nil && chapter!.longitude != 0 {
            locationDataManager.setDestination(latitude: chapter!.latitude, longitude: chapter!.longitude)
        } else {
            locationDataManager.setDestination(latitude: locationDataManager.latitude ?? 0, longitude: locationDataManager.longitude ?? 0)
        }
    }
    
    func reset(){
        storyDataManager.reset()
        let chapter = storyDataManager.currentChapter
        updateDestination(chapter: chapter)
    }
    
    var body: some View {
        
        VStack {
            switch locationDataManager.locationManager.authorizationStatus {
            case .authorizedWhenInUse:  // Location services are available.
                // Insert code here of what should happen when Location services are authorized
                
                // Cheat codes :-)
                HStack{
                    Button("reset", action: reset).foregroundColor(Color.gray.opacity(0.2)).padding(.leading)
                    Spacer()
                    Button("skip", action: increment).foregroundColor(Color.gray.opacity(0.2)).padding(.trailing)
                }.frame(maxWidth: .infinity)
                
                if (storyDataManager.currentChapter != nil){
                    
                    StoryView(storyDataManager: storyDataManager).frame(maxWidth: .infinity)
                    
                    if locationDataManager.distanceToDestination != nil &&
                        locationDataManager.distanceToDestination! < 8 {
                        
                        if (storyDataManager.isLastChapter()){
                            Button(action: reset){
                                Text("FiniSh")
                                    .fontWeight(.black)
                                    .frame(maxWidth: .infinity)
                                    .padding(
                                    ).foregroundColor(Color.white)
                            }
                            .background(Color.green)
                        } else {
                            Button(action: increment) {
                                Text("NExT CLUe")
                                    .fontWeight(.black)
                                    .frame(maxWidth: .infinity)
                                    .padding(
                                    ).foregroundColor(Color.white)
                            }
                            .background(Color.green)
                        }
                    }
                    
                    DashboardView(
                        locationDataManager: locationDataManager
                    )
                } else {
                    // Story is not loaded yet
                    Button(action: reset){
                        Text("Start")
                            .fontWeight(.black)
                            .frame(maxWidth: .infinity)
                            .padding(
                            ).foregroundColor(Color.white)
                    }
                    .background(Color.green)
                }
                
               
                
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
