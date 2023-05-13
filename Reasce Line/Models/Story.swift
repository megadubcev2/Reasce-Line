//
//  Story.swift
//  Reasce Line
//
//  Created by Алексей Королёв on 06.02.2023.
//

import Foundation

public class Story : ObservableObject, Codable{

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
    enum CodingKeys: CodingKey {
        case id, author, profileName, profileImageUrl, storyNodesCount, playerAnswersCount,
             allStoryNodesDictionary, allPlayerAnswers, emptyStoryNode, emptyPlayerAnswer,
             firstStoryNodeId
            
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
     
        id = try values.decode(Int.self, forKey: .id)
        author = try values.decode(String.self, forKey: .author)
        profileName = try values.decode(String.self, forKey: .profileName)
        profileImageUrl = try values.decode(String.self, forKey: .profileImageUrl)
        
        storyNodesCount = try values.decode(Int.self, forKey: .storyNodesCount)
        playerAnswersCount = try values.decode(Int.self, forKey: .playerAnswersCount)
        allStoryNodesDictionary = try values.decode([Int: StoryNode].self, forKey: .allStoryNodesDictionary)
        allPlayerAnswers = try values.decode([Int: PlayerAnswer].self, forKey: .allPlayerAnswers)
        
        emptyStoryNode = try values.decode(StoryNode.self, forKey: .emptyStoryNode)
        emptyPlayerAnswer = try values.decode(PlayerAnswer.self, forKey: .emptyPlayerAnswer)
        firstStoryNodeId = try values.decode(Int.self, forKey: .firstStoryNodeId)
    }
     
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(author, forKey: .author)
        try container.encode(profileName, forKey: .profileName)
        try container.encode(profileImageUrl, forKey: .profileImageUrl)
        
        try container.encode(storyNodesCount, forKey: .storyNodesCount)
        try container.encode(playerAnswersCount, forKey: .playerAnswersCount)
        try container.encode(allStoryNodesDictionary, forKey: .allStoryNodesDictionary)
        try container.encode(allPlayerAnswers, forKey: .allPlayerAnswers)
        
        try container.encode(emptyStoryNode, forKey: .emptyStoryNode)
        try container.encode(emptyPlayerAnswer, forKey: .emptyPlayerAnswer)
        try container.encode(firstStoryNodeId, forKey: .firstStoryNodeId)
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
    
    
    public func addStoryNode(botMessageTexts : [String], needAddPlayerAnswer : Bool = false) -> Int{
        
        storyNodesCount = storyNodesCount + 1
        
        var botMessages : [Message] = []
        for botMessageText in botMessageTexts {
            botMessages.append(Message(text: botMessageText, sender: .bot))
        }
            
        var storyNode = StoryNode(id: storyNodesCount, botMessages: botMessages, playerAnswersId: [])
        allStoryNodesDictionary[storyNodesCount] = storyNode
        if(needAddPlayerAnswer){
            addPlayerAnswerToStoryNode(storyNodeId: storyNode.id, playerAnswerText: "")
        }
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
