//
//  BotAnswerCreatorView.swift
//  Reasce Line
//
//  Created by Andrew on 01.05.2023.
//

import SwiftUI

struct PlayerAnswerCreatorView: View {
    @StateObject var story: Story
    @StateObject var playerAnswer: PlayerAnswer
    var botAnswerCreatorView: BotAnswerCreatorView
    //@State var playerMessageText: String = ""
    @State var isOpenedBotAnswers: Bool = false
    @State var nestingLevel: Int
    var body: some View {
        VStack(spacing: 5){
            HStack(spacing: CGFloat(nestingLevel)*25+1){
                Text("")
                HStack{
                    Button(action: { isOpenedBotAnswers.toggle()})
                    {
                        
                        isOpenedBotAnswers ? Image(systemName: "chevron.down") : Image(systemName: "chevron.right")
                    }
                    TextField("Enter your password:", text: $playerAnswer.answerText).padding(5).cornerRadius(45).border(.blue).frame(width: 250)
                    
                    Button(action: {
                        
                            botAnswerCreatorView.deletePlayerAnswer(playerAnswerId: playerAnswer.id)})
                    {
                        
                        Image(systemName: "trash").foregroundColor(.red)
                    }
                    
                }
                Spacer()
            }
                if(isOpenedBotAnswers){
                    HStack(){
                        BotAnswerCreatorView(story: story, storyNodeId:  playerAnswer.nextStoryNodeId, nestingLevel: nestingLevel, lastPlayerAnswer: playerAnswer)
                    }
                }
        }//.onAppear {
           // playerMessageText = playerAnswer.answerText
        //}
        
    }
}

struct PlayerAnswerCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        
        Text("aaa")
        
        //var story = Story(id: 1, author: "Andrew" , profileName: "Эрих Мария Ремарк", profileImageUrl: "https://amiel.club/uploads/posts/2022-03/1647762836_1-amiel-club-p-kartinki-litsa-cheloveka-1.jpg", firstMessageText: "На Западном фронте без перемен")
        
       // PlayerAnswerCreatorView(story: story, playerAnswer: story.emptyStoryNode., nestingLevel: 0)
    }
}
