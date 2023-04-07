//
//  Message.swift
//  MysteryMeter
//
//  Created by Erlend Tyrmi on 07/04/2023.
//

import SwiftUI

struct MessageView: View {
    var sender: String?
    var message: String?
    @State var open: Bool = true
    
    func toggle () -> Void {
        open = !open
    }
    
    var body: some View {
        VStack{
            Button("toggLE", action: toggle)
            
            if (open){
                Label(sender ?? "...", systemImage: "paperplane")
                    .font(.title)
                    .labelStyle(.titleAndIcon)
                Text(message ?? "...")}
        }.frame(alignment: .leading)
    }
}
