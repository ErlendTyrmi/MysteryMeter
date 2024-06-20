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
                RadarView(radarColor: Color.green).frame(maxWidth: 80)
            } else if (locationDataManager.distanceToDestination != nil && locationDataManager.distanceToDestination! < 40) {
                RadarView(radarColor: Color.orange).frame(maxWidth: 80)
            } else if (locationDataManager.distanceToDestination != nil && locationDataManager.distanceToDestination! < 100) {
                RadarView(radarColor: Color.cyan).frame(maxWidth: 80)
            } else {
                RadarView(radarColor: .gray).frame(maxWidth: 80)
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
                Text("x1: \(String(format: "%.6f", locationDataManager.latitude ?? 0))")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 10))
                Text("y1: \(String(format: "%.6f", locationDataManager.longitude ?? 0))")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 10))
            }.frame(maxWidth: 80, alignment: .leading)
            
        }.frame(maxWidth: .infinity)
            .padding()
    }
}
