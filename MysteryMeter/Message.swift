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
    @State var open: Bool
    
    func toggle () -> Void {
        open = !open
    }
    
    var body: some View {
        VStack{
            if (open){
                VStack{
                    Text(sender ?? "...")
                        .font(.system(size: 12))
                        .frame(maxWidth:.infinity, alignment: .leading)
                        .padding(.bottom, 8)
                    
                    Text(message ?? "...")
                        .frame(maxWidth:.infinity, alignment: .leading)
                }
                .padding()
                .background(Color.black)
                .cornerRadius(20)
                .opacity(0.7)
            }
            
            HStack{
                Button{
                    toggle()
                } label: {
                    if (!open){
                        Label("Show message", systemImage: "paperplane").foregroundColor(.white)
                    } else {
                        Label("Hide message", systemImage: "paperplane").foregroundColor(.white)
                    }
                }
                .padding()
                .background(Color.black)
                .clipShape(Capsule())
                .padding(.bottom)
                .padding(.top, 10)
            }
            
        }
    }
}
