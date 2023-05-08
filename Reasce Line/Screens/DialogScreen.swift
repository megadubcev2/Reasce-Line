//
//  DialogScreen.swift
//  Reasce Line
//
//  Created by Алексей Королёв on 06.02.2023.
//

import SwiftUI

struct DialogScreen: View {

    @StateObject var chat : Chat
    
    var body: some View {
        VStack {
            VStack{
                ScrollView{
                    ForEach(chat.dialogHistory, id:\.self){
                        message in MessageBubble(message: message)
                    }
                    
                }
                .padding(.top,10)
                .background(.white)
            }.background(Color("Color"))
            
                VStack(spacing: -25){
                    ForEach(chat.playerAnswersNowId.map{chat.getStory().getPlayerAnswerById(id: $0)}, id:\.self){
                        playerAnswer in Answer_(playerAnswer: playerAnswer, chat: chat)
                    }
                }.background(Color("fMessage")).padding(.top,-9)
        
        }
    }
}

struct DialogScreen_Previews: PreviewProvider {
    static var previews: some View {
        DialogScreen(chat : ChatsController.chatsArray.chats[0])
    }
}
