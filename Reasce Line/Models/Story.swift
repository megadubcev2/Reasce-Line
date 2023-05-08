//
//  Story.swift
//  Reasce Line
//
//  Created by Алексей Королёв on 06.02.2023.
//

import Foundation

public class Story : ObservableObject{

    //, Identifiable, Codable{
    
    // все созданные
    private var storyNodesCount : Int
    private var playerAnswersCount : Int
    
    public var id: Int
    private var author: String
    @Published var profileName : String
    public var profileImageUrl: String
    private var firstStoryNodeId: Int
    //@Published
    public var allStoryNodesDictionary: [Int: StoryNode]
    //@Published
    public var allPlayerAnswers: [Int: PlayerAnswer]
    
    public var emptyStoryNode: StoryNode
    public var emptyPlayerAnswer: PlayerAnswer
    
    
    public init(id: Int, author: String, profileName: String, profileImageUrl: String, firstMessageText: String) {
        self.id = id
        self.author = author
        self.profileName = profileName
        self.profileImageUrl = profileImageUrl
        
        storyNodesCount = 0
        playerAnswersCount = 0
        allStoryNodesDictionary = [:]
        allPlayerAnswers = [:]
        emptyStoryNode = StoryNode(id: 0, botMessages: [], playerAnswersId: [])
        emptyPlayerAnswer = PlayerAnswer(id: 0, answerText: "", nextStoryNodeId: 0)
        
        self.firstStoryNodeId = 1
        
        self.firstStoryNodeId = addStoryNode(botMessageTexts: [firstMessageText])
        
        
    }
    
    
    
    //public func getAllStoryNodesDictionary() -> [Int: StoryNode]{
      //  return allStoryNodesDictionary
    //}
    
    public func getFirstStoryNodeId() -> Int{
        return firstStoryNodeId
    }
    
    public func getStoryNodeById(id : Int) -> StoryNode{
        return allStoryNodesDictionary[id] ?? emptyStoryNode
    }
    
    public func getPlayerAnswerById(id : Int) -> PlayerAnswer{
        return allPlayerAnswers[id] ?? emptyPlayerAnswer
    }
    
    
    public func addStoryNode(botMessageTexts : [String]) -> Int{
        
        storyNodesCount = storyNodesCount + 1
        
        var botMessages : [Message] = []
        for botMessageText in botMessageTexts {
            botMessages.append(Message(text: botMessageText, sender: .bot))
        }
            
        var storyNode = StoryNode(id: storyNodesCount, botMessages: botMessages, playerAnswersId: [])
        allStoryNodesDictionary[storyNodesCount] = storyNode
        addPlayerAnswerToStoryNode(storyNodeId: storyNode.id, playerAnswerText: "")
        
        return storyNode.id
    }
    
    public func addPlayerAnswerToStoryNode(storyNodeId : Int, playerAnswerText: String = "", nextStoryNodeId: Int = 0) -> Int?{
        if let storyNode = allStoryNodesDictionary[storyNodeId]{
            playerAnswersCount+=1
            var playerAnswer = PlayerAnswer(id: playerAnswersCount, answerText: playerAnswerText, nextStoryNodeId: nextStoryNodeId)
            allPlayerAnswers[playerAnswer.id] = playerAnswer
            storyNode.playerAnswersId.append(playerAnswer.id)
            return playerAnswer.id
        }
        else{
            print("Ошибка создания ответа пользователя")
            return nil
        }
    }
    public func deletePlayerAnswer(storyNodeId : Int, playerAnswerId : Int){
        print(getStoryNodeById(id: storyNodeId).playerAnswersId)
        getStoryNodeById(id: storyNodeId).playerAnswersId.removeAll{
            $0 == playerAnswerId
        }
        
        print(getStoryNodeById(id: storyNodeId).playerAnswersId)

    }
    public func getLastNewStoryNodeId() -> Int{
        storyNodesCount
    }
    
    
}

extension Story: Hashable {
    public static func == (lhs: Story, rhs: Story) -> Bool {
        return lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
