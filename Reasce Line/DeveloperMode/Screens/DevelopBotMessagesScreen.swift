//
//  DevelopBotMessagesScreen.swift
//  Reasce Line
//
//  Created by Andrew on 07.05.2023.
//


import SwiftUI

struct DevelopBotMessagesScreen: View {

    @StateObject var storyNode : StoryNode
    @State var messageText : String = ""
    @State var isVisible : Bool = true
    
    var body: some View {
        VStack {
            if(isVisible){
                VStack{
                    ScrollView{
                        ForEach(storyNode.botMessages, id:\.self){
                            message in DevelopMessageBubble(developBotMessagesScreen: self, message: message)
                        }
                        
                    }
                    .padding(.top,10)
                    .background(.white)
                }.background(Color("Color"))
            }
            
            HStack{
                TextField("", text: $messageText).padding().textFieldStyle(.roundedBorder)
                Button(action: {
                    if(messageText != ""){
                        storyNode.addMessage(message: Message(text: messageText, sender: .bot))
                        messageText = ""
                    }
                    })
                {
                    Image(systemName: "arrow.up.circle.fill").foregroundColor(.blue).font(.system(size: 25)).padding()
                }
                
            }
        
        }

        }
    
    public func deleteMessage(messageId : UUID){
        DispatchQueue.main.asyncAfter(deadline: .now()){
            storyNode.deleteMessage(messageId: messageId)
            updateScreen()
            
        }
    }
    
    public func updateScreen(){
        isVisible.toggle()
        isVisible.toggle()
    }
}

struct DevelopBotMessagesScreen_Previews: PreviewProvider {
    static var previews: some View {
        var story = Story(id: 1, author: "Andrew" , profileName: "Эрих Мария Ремарк", profileImageUrl: "https://amiel.club/uploads/posts/2022-03/1647762836_1-amiel-club-p-kartinki-litsa-cheloveka-1.jpg", firstMessageText: "На Западном фронте без перемен")
        DevelopBotMessagesScreen(storyNode: story.getStoryNodeById(id: 1))
    }
}
