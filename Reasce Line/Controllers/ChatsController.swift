//
//  ChatsController.swift
//  Reasce Line
//
//  Created by Andrew on 13.03.2023.
//

import Foundation

public class ChatsController{
    private static var storiesController : StoriesController = StoriesController()
    private static var chats : [Chat] = storiesController.stories.map{Chat(story: $0)}
    public static var chatsArray = ChatsArray(chats: chats)
    


    
//    public init(){
//        storiesController = StoriesController()
//        for story in storiesController.strories {
//            chats.append(Chat(story: story))
//        }
//
//
//
//    }
}
