//
//  ChatsArray.swift
//  Reasce Line
//
//  Created by Andrew on 14.03.2023.
//

import Foundation

public class ChatsArray: ObservableObject{
    @Published var chats : [Chat]
    init(chats: [Chat]) {
        self.chats = chats
    }
}
