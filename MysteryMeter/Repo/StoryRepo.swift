//
//  StoryRepo.swift
//  MysteryMeter
//
//  Created by Erlend Tyrmi on 07/04/2023.
//

import Foundation

struct Chapter {
    var id: String;
    var sender: String;
    var content: String;
    var imageUrl: String;
    var latitude: Double;
    var longitude: Double;
}

class StoryRepo : NSObject, ObservableObject{
    
    func fetchChapters() -> [Chapter]{
        var _chapters = [Chapter]()
        _chapters.append(Chapter(
            id:"Start",
            sender:"Easter Bunny",
            content: "Big trouble! Someone has been stealing my eggs lately. I’m hoping you could snoop around and help me find the thief. Try asking the cute dog. He’s always watching, so he could have seen something…",
            imageUrl: "https://live.staticflickr.com/65535/52797801487_9bed7d739a_k.jpg",
            latitude: 55.698567016960006,
            longitude: 12.581984298047066

        ))
        
        _chapters.append(Chapter(
            id:"Cute Dog",
            sender:"Cute Dog",
            content: "Yes, someone was here. A black rabbit with a fur hat, have you ever seen anything like that? Filthy looking animal too! They game up from the lake. There’s a strange black structure there. Look for clues there!",
            imageUrl: "https://live.staticflickr.com/65535/52798814018_105d4561ce_k.jpg",
            latitude: 55.696882179451556,
            longitude: 12.579065627450907
        ))
        
        _chapters.append(Chapter(
            id:"Bent Iron",
            sender:"Easter Bunny",
            content: "Are you there yet? Oh I see you now. The structure seems to be.. art? Anyway, the black rabbit was seen carrying a bunch of special equipment. Try heading to the gadget store. There’s a sale now too!”",
            imageUrl: "https://live.staticflickr.com/65535/52797801582_6e57725bed_k.jpg",
            latitude: 55.70127552380385,
            longitude: 12.580516906466876
        ));
        
        _chapters.append(Chapter(
            id:"The Store",
            sender:"Easter Bunny",
            content: "Finally you’re here! I saw someone snoop around here. Didn’t buy anything, but some false moustaches are missing. My assistant managed to follow them to a strange place south of here. There used to be big machines there, but now it’s full of sus-looking stuff.",
            imageUrl: "https://live.staticflickr.com/65535/52797801462_b12e295590_k.jpg",
            latitude: 55.698769804717514,
            longitude: 12.586782321119625
        ));
        
        _chapters.append(Chapter(
            id:"Laundromat",
            sender:"Cute Dog",
            content: "Yup, this is an egg-cracking factory. Horrible place! I got an update for you. They were heading in the direction of the big obelisk, carrying a black backpack. Sus. Very sus. Bunny will keep you posted.",
            imageUrl: "https://live.staticflickr.com/65535/52798761125_d5fde9ea73_k.jpg",
            latitude: 55.697966009478,
            longitude: 12.58899839984047
        ));
        
        _chapters.append(Chapter(
            id:"The Obelisk",
            sender:"Easter Bunny",
            content: "No place to hide eggs here. Hurry to the epic flower garden, before all the eggs are smashed by the evil rabbit!",
            imageUrl: "https://live.staticflickr.com/65535/52797801662_9b35200a10_k.jpg",
            latitude: 55.699969743862376,
            longitude: 12.588483524160068
        ))
        
        _chapters.append(Chapter(
            id:"Garden",
            sender:"Easter Bunny",
            content: "EPIC! I see you on the bunnyCam. The evil bunny got away, but we saved the eggs. Look around and you'll see them. Enjoy, friend! HAPPY EASTER, XOXO E.B.",
            imageUrl: "https://cdn.pixabay.com/photo/2022/08/23/11/57/rabbit-7405618_1280.png",
            latitude: 0,
            longitude: 0
        ))
        
        return _chapters
    }
}
