//
//  ActiveStories.swift
//  Reasce Line
//
//  Created by Алексей Королёв on 10.03.2023.
//

import SwiftUI

struct ActiveStories: View {
    var text  = Text("Активные")
    @StateObject var chatsArray : ChatsArray
    @State var isVisible = true
    //= ChatsController.chatsArray
    
//    var storyArray = ["R,D","Эрих Мария Ремар","AGADFGAFDGDG","Эрих Мария Ремар","Эрих Мария Ремар","Эрих Мария Ремар","Эрих Мария Ремар","Эрих Мария Ремар","Эрих Мария Ремар"]
    
    var body: some View {
            ZStack {
                VStack {
                        ScrollView{
                            if(isVisible){
                                ForEach(chatsArray.chats, id:\.self){
                                    chat in StoryBlock(chat: chat)
                                }
                            }
                        }.onAppear{
                            update()
                        }
                }
                }

    }
    private func update(){
        DispatchQueue.main.asyncAfter(deadline: .now()){
            isVisible.toggle()
            isVisible.toggle()
        }
    }
}

struct ActiveStories_Previews: PreviewProvider {
    static var previews: some View {
        ActiveStories(chatsArray: ChatsController.chatsArray)
    }
}
