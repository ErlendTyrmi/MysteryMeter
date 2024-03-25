//
//  Repo.swift
//  MysteryMeter
//
//  Created by Erlend Tyrmi on 07/04/2023.
//

import Foundation

// Test repo class
class StoryDataManager : NSObject, ObservableObject{
    let storyRepo = StoryRepo()
    private var chapterIndex : Int = 0
    @Published var currentChapter: Chapter?
    
    override init() {
        super.init()
        
        // Read defaults before loading data
        chapterIndex = UserDefaults.standard.integer(forKey: "next")
        
        loadChapters()
    }
    
    func increment() -> Void {
        chapterIndex += 1;
        
        // Loop through the chapters
        if (chapterIndex > storyRepo.chapters.count - 1){
            chapterIndex = 0
        }
        
        UserDefaults.standard.set(self.chapterIndex, forKey: "next")
        setCurrentChapter()
    }
    
    func reset(){
        chapterIndex = 0
        UserDefaults.standard.set(self.chapterIndex, forKey: "next")
        setCurrentChapter()
    }
    
    func isLastChapter() -> Bool {
        return chapterIndex >= storyRepo.chapters.count - 1
    }
    
    private func setCurrentChapter(){
        if (chapterIndex < storyRepo.chapters.count){
            currentChapter = storyRepo.chapters[chapterIndex]
        }
    }
    
    private func loadChapters() {
        storyRepo.fetchChapters()
    }
}
