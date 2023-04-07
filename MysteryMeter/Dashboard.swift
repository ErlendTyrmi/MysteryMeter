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
            
            // TODO: Radar blinking and spinning
            if (locationDataManager.distanceToDestination != nil && locationDataManager.distanceToDestination! < 15) {
                Circle().frame(width: 42).foregroundColor(Color.green)
            } else if (locationDataManager.distanceToDestination != nil && locationDataManager.distanceToDestination! < 20) {
                Circle().frame(width: 42).foregroundColor(Color.yellow)
            } else if (locationDataManager.distanceToDestination != nil && locationDataManager.distanceToDestination! < 100) {
                Circle().frame(width: 42).foregroundColor(Color.red)
            } else {
                Circle().frame(width: 42).foregroundColor(Color.gray)
            }
           
            
            Spacer()
            
            if locationDataManager.distanceToDestination != nil{
                let dist = "\(String(format: "%.0f", locationDataManager.distanceToDestination!)) m"
                Text(dist)
            } else {
                Text("__")
            }
            
            Spacer()
            
            VStack{
                Text("X: \(locationDataManager.latitude?.description ?? "Error loading")")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 10))
                Text("Y: \(locationDataManager.longitude?.description ?? "Error loading")")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 10))
            }.frame(maxWidth: 200, alignment: .leading)
            
            
        }.frame(maxWidth: .infinity)
            .padding()
    }
}
