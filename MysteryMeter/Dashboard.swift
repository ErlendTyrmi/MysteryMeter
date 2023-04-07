//
//  Dashboard.swift
//  MysteryMeter
//
//  Created by Erlend Tyrmi on 07/04/2023.
//

import SwiftUI

struct DashboardView: View {
    @StateObject var locationDataManager : LocationDataManager
    
    var body: some View {
        VStack{
            Text("Latitude: \(locationDataManager.latitude?.description ?? "Error loading")")
            Text("Longitude: \(locationDataManager.longitude?.description ?? "Error loading")")
            Text("Distance: \(locationDataManager.distanceToDestination?.description ?? "Error loading")")
        }.padding()
    }
}
