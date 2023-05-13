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

public class PlayerAnswer: ObservableObject, Codable{
    
    public var id : Int
    
    @Published var answerText : String
    private var message : Message
    @Published var nextStoryNodeId : Int
    
    enum CodingKeys: CodingKey {
        case id, answerText, message, nextStoryNodeId
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
     
        id = try values.decode(Int.self, forKey: .id)
        answerText = try values.decode(String.self, forKey: .answerText)
        message = try values.decode(Message.self, forKey: .message)
        nextStoryNodeId = try values.decode(Int.self, forKey: .nextStoryNodeId)
    }
     
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(answerText, forKey: .answerText)
        try container.encode(message, forKey: .message)
        try container.encode(nextStoryNodeId, forKey: .nextStoryNodeId)
    }
    
    public init(id: Int, answerText : String, nextStoryNodeId: Int) {
        self.id = id
        self.answerText = answerText
        self.message = Message(text: answerText, sender: .player)
        self.nextStoryNodeId = nextStoryNodeId
    }
    
    public func getMessage() -> Message {
        self.message = Message(text: answerText, sender: .player)
        return message

    }
    
    
}

extension PlayerAnswer : Hashable {
    public static func == (lhs: PlayerAnswer, rhs: PlayerAnswer) -> Bool {
        lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


