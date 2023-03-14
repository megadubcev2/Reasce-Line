//
//  Story.swift
//  Reasce Line
//
//  Created by Алексей Королёв on 06.02.2023.
//

import Foundation

public struct Story : Identifiable, Codable{
    
    // все созданные
    private var storyNodesCount : Int
    
    public var id: Int
    private var author: String
    public var profileName : String
    public var profileImageUrl: String
    private var firstStoryNodeId: Int
    public var allStoryNodesDictionary: [Int: StoryNode]
    
    public init(id: Int, author: String, profileName: String, profileImageUrl: String, firstMessageText: String) {
        self.id = id
        self.author = author
        self.profileName = profileName
        self.profileImageUrl = profileImageUrl
        
        storyNodesCount = 0
        allStoryNodesDictionary = [:]
        self.firstStoryNodeId = 1
        
        self.firstStoryNodeId = addStoryNode(botMessageTexts: [firstMessageText])
    }
    
    
    
    //public func getAllStoryNodesDictionary() -> [Int: StoryNode]{
      //  return allStoryNodesDictionary
    //}
    
    public func getFirstStoryNodeId() -> Int{
        return firstStoryNodeId
    }
    
    public func getStoryNodeById(id : Int) -> StoryNode?{
        return allStoryNodesDictionary[id]
    }
    
    public mutating func addStoryNode(botMessageTexts : [String]) -> Int{
        
        storyNodesCount = storyNodesCount + 1
        
        var botMessages : [Message] = []
        for botMessageText in botMessageTexts {
            botMessages.append(Message(text: botMessageText, sender: .bot))
        }
            
        var storyNode = StoryNode(id: storyNodesCount, botMessages: botMessages, playerAnswers: [])
        allStoryNodesDictionary[storyNodesCount] = storyNode
        return storyNodesCount
    }
    
    public mutating func addPlayerAnswerToStoryNode(storyNodeId : Int, playerAnswerText: String, nextStoryNodeId: Int = 0){
        
        var nextStoryNodeId = nextStoryNodeId
        if(allStoryNodesDictionary[nextStoryNodeId] == nil){
            nextStoryNodeId = addStoryNode(botMessageTexts: ["эщкере"])
        }
        
        var playerAnswer = PlayerAnswer(answerText: playerAnswerText, nextStoryNodeID: nextStoryNodeId)
        
        allStoryNodesDictionary[storyNodeId]?.playerAnswers.append(playerAnswer)
    }
    
}
