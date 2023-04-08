//
//  RadarView.swift
//  MysteryMeter
//
//  Created by Erlend Tyrmi on 08/04/2023.
//

import SwiftUI

struct RadarView: View {
    var radarColor: Color
    
    @State var appear = false
    @State private var spinning = true
    
    var body: some View {
        ZStack{
            
            Circle()
                .stroke(radarColor.opacity(0.5), lineWidth: 25)
            
            VStack {
                        Circle()
                    .trim(from: 0, to: spinning ? 0 : 1)
                            .stroke(radarColor, lineWidth: 25)
                            .frame(width: 25, height: 25)
                            .rotationEffect(Angle(degrees: -90))
                            .animation(.easeInOut(duration: 2).repeatForever(autoreverses: false), value: spinning)
                            
                    }.onAppear {
                        spinning = false
                    }
        }.frame(width: 25,height: 25).padding()
        
    }
}
