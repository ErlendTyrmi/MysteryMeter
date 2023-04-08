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
    
    override init() {
        super.init()
        
        loadData()
    }
    
    public var nextIndex = 0;
    private var chapters = [Chapter]();
    
    @Published var currentChapter: Chapter?;

    func increment() -> Void {
        nextIndex += 1;
        
        if (nextIndex > chapters.count){
            nextIndex = 0
        }
        
        setCurrentChapter()
    }
    
    func reset(){
        nextIndex = 0
        
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
    
    private func loadData(){
        // Create test data
        chapters = storyRepo.fetchChapters();
        currentChapter = chapters[nextIndex]
    }
}
