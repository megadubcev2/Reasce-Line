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

public class PlayerAnswer: ObservableObject {
    
    public var id : Int
    
    @Published var answerText : String
    private var message : Message
    @Published var nextStoryNodeId : Int
    
    public init(id: Int, answerText : String, nextStoryNodeId: Int) {
        self.id = id
        self.answerText = answerText
        self.message = Message(text: answerText, sender: .player)
        self.nextStoryNodeId = nextStoryNodeId
    }
    
    public func getMessage() -> Message {
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
