//
//  Message.swift
//  Reasce Line
//
//  Created by Алексей Королёв on 05.02.2023.
//

import Foundation

public struct Message: Codable, Hashable{
    public static var messagesCount = 0
    
    public var id : UUID
    public var text: String
    public var sender: Sender
    public var timeToWrite: Double
    public var timeToWait: Double
    
    public init(text: String, sender: Sender, timeToWait: Double = 1.0) {
        id = UUID()//Message.messagesCount
        Message.messagesCount = Message.messagesCount + 1
        self.text = text
        self.sender = sender
        self.timeToWrite = 0.1 + Double(text.count)/15
        self.timeToWait = timeToWait
    }
}
