//
//  PlayerAnswer.swift
//  Reasce Line
//
//  Created by Andrew on 13.03.2023.
//

import Foundation

// вариант ответа от игрока
// который содержит сообщение которое будет отправлено игроком
// и последующий узел истории к которому приведет этот ответ

public struct PlayerAnswer: Codable, Hashable {
    private static var playerAnswersCount : Int = 0
    
    public var id : Int
    
    public var answerText : String
    private var message : Message
    public var nextStoryNodeID : Int
    
    public init(answerText : String, nextStoryNodeID: Int) {
        id = PlayerAnswer.playerAnswersCount
        PlayerAnswer.playerAnswersCount = PlayerAnswer.playerAnswersCount + 1
        self.answerText = answerText
        self.message = Message(text: answerText, sender: .player)
        self.nextStoryNodeID = nextStoryNodeID
    }
    
    public func getMessage() -> Message {
        return message
    }
}
