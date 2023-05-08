//
//  Message.swift
//  Reasce Line
//
//  Created by Алексей Королёв on 05.02.2023.
//

import Foundation

public struct Message: Codable, Hashable{
    public static var messagesCount = 0
    
    public var id : Int
    public var text: String
    public var sender: Sender
    public var timeToWrite: Int
    public var timeToWait: Int
    
    public init(text: String, sender: Sender, timeToWait: Int = 1) {
        id = Message.messagesCount
        Message.messagesCount = Message.messagesCount + 1
        self.text = text
        self.sender = sender
        self.timeToWrite = 1 + text.count/10
        self.timeToWait = timeToWait
    }
}
