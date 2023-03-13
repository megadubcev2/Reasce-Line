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

public struct PlayerAnswer: Codable {
    public var message : Message
    public var nextStoryNodeID : Int
    
    public init(message: Message, nextStoryNodeID: Int) {
        self.message = message
        self.nextStoryNodeID = nextStoryNodeID
    }
}
