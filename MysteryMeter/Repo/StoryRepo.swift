//
//  StoryRepo.swift
//  MysteryMeter
//
//  Created by Erlend Tyrmi on 07/04/2023.
//

import Foundation
import Firebase

struct Chapter {
    var id: String;
    var sender: String;
    var content: String;
    var imageUrl: String;
    var latitude: Double;
    var longitude: Double;
}

class StoryRepo : NSObject, ObservableObject{
    @Published var chapters = [Chapter]()
    
    func fetchChapters() {
        
        let db = Firestore.firestore()
        let ref = db.collection("chapters")
        
        ref.getDocuments { snapshot, error in
            
            guard error == nil else {
                print(error?.localizedDescription as? String ?? "")
                return
            }
            
            if let snapshot = snapshot{
                for document in snapshot.documents {
                
                    let data = document.data()
                    
                let id = data["id"] as? String ?? ""
                let sender = data["sender"] as? String ?? ""
                let content = data["content"] as? String ?? ""
                let imageUrl = data["imageUrl"] as? String ?? ""
                let latitude = data["latitude"] as? Double ?? 0
                let longitude = data["longitude"] as? Double ?? 0
                    
                    self.chapters.append(Chapter(
                        id: id,
                        sender: sender,
                        content: content,
                        imageUrl: imageUrl,
                        latitude: latitude,
                        longitude: longitude
                    ))
                }
                
                self.chapters.sort {
                    $0.id < $1.id
                }
            
                print("Chapters downloaded:")
                
                for chap in self.chapters{
                    print(chap.id)
                }
            }
        }
    }
}
