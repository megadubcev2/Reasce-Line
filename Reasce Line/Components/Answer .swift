//
//  Answer .swift
//  Reasce Line
//
//  Created by Алексей Королёв on 05.02.2023.
//

import SwiftUI

struct Answer_: View {
    var playerAnswer: PlayerAnswer
    var chat: Chat
    var body: some View {
        Button{
            //print(chat.storyNodeNow)
            chat.chooseAnswer(chosenAnswer: playerAnswer)
            print(chat.dialogHistory)
        } label: {
            Text(playerAnswer.answerText).foregroundColor(.black).padding()
        }.frame(maxWidth: .infinity).background(.white).cornerRadius(20).padding()
    }
}

struct Answer__Previews: PreviewProvider {
    static var previews: some View {
        Answer_(playerAnswer: PlayerAnswer(answerText: "...", nextStoryNodeID: 0), chat: ChatsController.chatsArray.chats[0])
    }
}
