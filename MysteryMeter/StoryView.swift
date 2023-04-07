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
                
                MessageView(sender: storyDataManager.currentChapter!.sender, message: storyDataManager.currentChapter!.content)
              
            }.background(
                AsyncImage(url: URL(string: storyDataManager.currentChapter!.imageUrl)) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
            )
            .padding()
        }
    }
}
