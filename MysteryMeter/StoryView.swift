//
//  StoryView.swift
//  MysteryMeter
//
//  Created by Erlend Tyrmi on 07/04/2023.
//

import Foundation
import SwiftUI

struct StoryView: View {
    @ObservedObject var storyDataManager: StoryDataManager
    
    var body: some View {
        
        if storyDataManager.currentChapter != nil{
            VStack{
                
                Spacer()
                
                MessageView(
                    sender: storyDataManager.currentChapter!.sender,
                            message: storyDataManager.currentChapter!.content,
                    open: false)
              
            }.background(
                AsyncImage(url: URL(string: storyDataManager.currentChapter!.imageUrl)) { image in
                    image.resizable()
                        .scaledToFill()
                        .clipped()
                     
                } placeholder: {
                    ProgressView()
                }
            )
            .frame(maxWidth: .infinity)
            .padding(.leading).padding(.trailing)
        }
    }
}
