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
        HStack{
            if locationDataManager.distanceToDestination != nil{
                let dist = "\(String(format: "%.0f", locationDataManager.distanceToDestination!)) m"
                Text(dist)
            }
            
            
            VStack{
                Text("Lat: \(locationDataManager.latitude?.description ?? "Error loading")")
                Text("Lon: \(locationDataManager.longitude?.description ?? "Error loading")")
            }
            
            
        }.padding()
    }
}
