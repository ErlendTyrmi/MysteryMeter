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
    
    private var nextIndex : Int = 0
    private var chapters = [Chapter]();
    
    override init() {
        super.init()
        
        // Read defaults before loading text
        nextIndex = UserDefaults.standard.integer(forKey: "next")
        
        loadChapters()
    }
    
    @Published var currentChapter: Chapter?;
    
    func increment() -> Void {
        nextIndex += 1;
        
        if (nextIndex > chapters.count - 1){
            nextIndex = 0
        }
        
        UserDefaults.standard.set(self.nextIndex, forKey: "next")
        
        setCurrentChapter()
    }
    
    func reset(){
        nextIndex = 0
        UserDefaults.standard.set(self.nextIndex, forKey: "next")
        setCurrentChapter()
    }
    
    func isLastChapter() -> Bool {
        return nextIndex >= chapters.count - 1
    }
    
    private func setCurrentChapter(){
        if (nextIndex < chapters.count){
            currentChapter = chapters[nextIndex]
        }
    }
    
    private func loadChapters(){
        // Create test data
        chapters = storyRepo.fetchChapters();
        currentChapter = chapters[nextIndex]
    }
}
