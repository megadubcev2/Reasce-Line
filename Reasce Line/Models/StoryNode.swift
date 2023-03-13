//
//  StoryNode.swift
//  Reasce Line
//
//  Created by Andrew on 12.03.2023.
//

import Foundation


// узел истории, в которой находятся сообщения от бота которые он напишет в данный момент
// и 1-3 варианта ответа от игрока
public struct StoryNode : Identifiable, Codable {
    public var id: Int
    public var botMessages: [Message]
    public var playerAnswers : [PlayerAnswer]
    
    public init(id: Int, botMessages: [Message], playerAnswers: [PlayerAnswer]) {
        self.id = id
        self.botMessages = botMessages
        self.playerAnswers = playerAnswers
    }
}
