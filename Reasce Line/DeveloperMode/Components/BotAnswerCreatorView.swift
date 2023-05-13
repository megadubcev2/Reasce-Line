//
//  BotAnswerCreatorView.swift
//  Reasce Line
//
//  Created by Andrew on 01.05.2023.
//

import SwiftUI

struct BotAnswerCreatorView: View {
    @StateObject var story: Story
    @State var storyNodeId: Int
    @State var firstMessageText: String = ""
    @State var isOpenedUserAnswers: Bool = false
    @State var nestingLevel: Int
    @State private var isTextFieldFocused = false
    //@State var areWeGoingToDevelopBotMessagesScreen = false
    var lastPlayerAnswer : PlayerAnswer?
    
  
    var body: some View {
        VStack(spacing: 5){
            HStack(spacing: CGFloat(nestingLevel)*25+1){
                Text("")
                HStack{
                    
                    Button(action: { isOpenedUserAnswers.toggle()})
                    {
                        
                        if(isOpenedUserAnswers){
                            Image(systemName: "chevron.down")
                        }
                        else{
                            Image(systemName: "chevron.right").padding(.horizontal, 3)
                        }
                    }
                    TextField("Enter your password:", text: $firstMessageText, onEditingChanged: { focused in
                        isTextFieldFocused = focused
                        if(!focused){
                            DispatchQueue.main.asyncAfter(deadline: .now()){
                                firstMessageText = story.getStoryNodeById(id: storyNodeId).getFirstMessageText()
                                }
                        }
                    }).textFieldStyle(.roundedBorder).frame(width: 250)
                    
                    Menu {
                        
                            
                            if(storyNodeId != 0){
                                Button(action: {
                                    addNewPlayerAnswer()
                                    
                                })
                                {
                                    Text("Добавить вариант ответа")
                                }
                                
                                NavigationLink {
                                    DevelopBotMessagesScreen(storyNode: story.getStoryNodeById(id: storyNodeId))
                                        .toolbar{
                                            ToolbarItemGroup(placement: .principal, content: {
                                                DevelopTitleRow(img: story.profileImageUrl, name: story.profileName)
                                            })
                                        }
                                } label: {
                                    Text("Редактировать")
                                }
                            }
                            
                            NavigationLink {
                                DevelopBotMessagesScreen(storyNode: story.getStoryNodeById(id:  story.addStoryNode(botMessageTexts: [], needAddPlayerAnswer : true)))
                                    .toolbar{
                                        ToolbarItemGroup(placement: .principal, content: {
                                            DevelopTitleRow(img: story.profileImageUrl, name: story.profileName)
                                        })
                                    }.onAppear{
                                        changeStoryNode(newStoryNodeId: story.getLastNewStoryNodeId())
                                    }
                            } label: {
                                Text("Создать новый")
                            }
                            
                        
                        
                    } label: {
                        Image(systemName: "ellipsis").foregroundColor(.black).rotationEffect(Angle(degrees: 90))
                    }
                   
                }
                Spacer()
            }
            if(isTextFieldFocused){
                SearchScrollView(story: story, firstMessageText: $firstMessageText, botAnswerCreatorView: self, nestingLevel: nestingLevel)
            }
            if(isOpenedUserAnswers){
                VStack(spacing: 5){
                    ForEach(story.getStoryNodeById(id: storyNodeId).playerAnswersId.map{story.getPlayerAnswerById(id: $0)} , id:\.self){
                        playerAnswer in PlayerAnswerCreatorView(story: story, playerAnswer: playerAnswer, botAnswerCreatorView: self, nestingLevel: nestingLevel + 1)
                    }
                    //AddPlayerAnswerButton(botAnswerCreatorView: self, nestingLevel: nestingLevel)
                }
            }
        }.onAppear {
            if(storyNodeId != 0){
                firstMessageText = story.getStoryNodeById(id: storyNodeId).getFirstMessageText()
            }
        }
    }
    
    
    
    public func changeStoryNode(newStoryNodeId : Int) {
        firstMessageText = story.getStoryNodeById(id: newStoryNodeId).getFirstMessageText()
        storyNodeId = newStoryNodeId
        if let lastPlayerAnswer = lastPlayerAnswer {
            lastPlayerAnswer.nextStoryNodeId = storyNodeId
        }
        isOpenedUserAnswers.toggle()
        isOpenedUserAnswers.toggle()
        
    }
    
    public func addNewPlayerAnswer(){
        DispatchQueue.main.asyncAfter(deadline: .now()){
            story.addPlayerAnswerToStoryNode(storyNodeId: storyNodeId)
            isOpenedUserAnswers.toggle()
            isOpenedUserAnswers.toggle()
        }
        
    }
    public func deletePlayerAnswer(playerAnswerId : Int){
        DispatchQueue.main.asyncAfter(deadline: .now()){
            story.deletePlayerAnswer(storyNodeId: storyNodeId, playerAnswerId: playerAnswerId)
            isOpenedUserAnswers.toggle()
            isOpenedUserAnswers.toggle()
        }
    }
        
}


struct BotAnswerCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        let story = Story(id: 1, author: "Andrew" , profileName: "Эрих Мария Ремарк", profileImageUrl: "https://amiel.club/uploads/posts/2022-03/1647762836_1-amiel-club-p-kartinki-litsa-cheloveka-1.jpg", firstMessageText: "На Западном фронте без перемен")
        BotAnswerCreatorView(story: story, storyNodeId : 0, nestingLevel: 0, lastPlayerAnswer: nil)
    }
}
