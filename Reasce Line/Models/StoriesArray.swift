//
//  StoriesArray.swift
//  Reasce Line
//
//  Created by Andrew on 18.04.2023.
//

import Foundation
public class StoriesArray: ObservableObject, Codable{
    @Published var stories : [Story]
    private var storiesCount = 5
    init(stories : [Story]) {
        self.stories = stories
    }
    
    enum CodingKeys: CodingKey {
        case stories, storiesCount
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
     
        stories = try values.decode([Story].self, forKey: .stories)
        storiesCount = try values.decode(Int.self, forKey: .storiesCount)
        
    }
     
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(stories, forKey: .stories)
        try container.encode(storiesCount, forKey: .storiesCount)
    }

    
    public func deleteStory(storyId : Int){
        stories.removeAll{
            $0.id == storyId
        }
    }
    public func addNewStory(){
        storiesCount += 1
        stories.append(Story(id: storiesCount, author: "Андрей", profileName: "История #" + String(storiesCount), profileImageUrl: "https://amiel.club/uploads/posts/2022-03/1647762836_1-amiel-club-p-kartinki-litsa-cheloveka-1.jpg", firstMessageText: "Первое сообщение" ))
    }
    
}

