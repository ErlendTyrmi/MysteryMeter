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
            if (open){
                VStack{
                    HStack{
                        Text(sender ?? "...s").font(.system(size: 12))
                        Spacer()
                    }
                    Text(message ?? "...")
                }
                .padding()
                .background(Color.black)
                .opacity(0.7)
            }
            
            HStack{
                Button{
                    toggle()
                } label: {
                    Label("toGGle maiL", systemImage: "paperplane").foregroundColor(Color.white)
                }.padding().background(Color.black).clipShape(Capsule()).padding()
            }
            
        }.frame(alignment: .leading)
    }
}
