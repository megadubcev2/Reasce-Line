//
//  StoryNode.swift
//  Reasce Line
//
//  Created by Andrew on 12.03.2023.
//

import Foundation


// узел истории, в которой находятся сообщения от бота которые он напишет в данный момент
// и 1-3 варианта ответа от игрока
public class StoryNode : Identifiable, ObservableObject {
    
    public var id: Int
    @Published var botMessages: [Message]
    @Published var playerAnswersId : [Int]
    
    public init(id: Int, botMessages: [Message], playerAnswersId: [Int]) {
        self.id = id
        self.botMessages = botMessages
        self.playerAnswersId = playerAnswersId
    }
    
    public func deleteMessage(messageId : Int){
        print("aaa")
        botMessages.removeAll{
            $0.id == messageId
        }
    }
    public func addMessage(message : Message){
        botMessages.append(message)
    }
    
    public func isEmpty() -> Bool{
        id == 0
    }
    public func getFirstMessageText() -> String{
        if (botMessages.count > 0){
            return botMessages[0].text
        }
        return "***Нет сообщений***"
    }
    public func getFirstMessage() -> Message{
        if (botMessages.count > 0){
            return botMessages[0]
        }
        return Message(text: "***Нет сообщений***", sender: .bot)
    }
}

extension StoryNode : Hashable {
    public static func == (lhs: StoryNode, rhs: StoryNode) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
