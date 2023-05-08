//
//  StoryBlock.swift
//  Reasce Line
//
//  Created by Алексей Королёв on 06.02.2023.
//

import SwiftUI

struct StoryBlock: View {
    @StateObject var chat: Chat
    var body: some View {
        NavigationLink {
            DialogScreen(chat: chat)
                         .toolbar{
                             ToolbarItemGroup(placement: .principal, content: {
                                 TitleRow(name: chat.profileName)
                             })
                         }
                 } label: {
            HStack{
                AsyncImage(url: URL(string: chat.profileImageUrl)){
                    image in image.resizable().aspectRatio(contentMode: .fill).aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .cornerRadius(40)
                }placeholder: {
                    ProgressView()
                }.padding(10)
                VStack(alignment: .leading){
                    Text(chat.profileName).font(.title2).frame(maxHeight: 30).foregroundColor(.black)
                    Text(chat.dialogHistory[chat.dialogHistory.count-1].text).font(.caption).foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
            }.padding(.horizontal)
                 };
    }
}

struct StoryBlock_Previews: PreviewProvider {
    static var previews: some View {
        StoryBlock(chat: Chat(story: Story(id: 1, author: "Andrew" , profileName: "Эрих Мария Ремарк", profileImageUrl: "https://amiel.club/uploads/posts/2022-03/1647762836_1-amiel-club-p-kartinki-litsa-cheloveka-1.jpg", firstMessageText: "На Западном фронте без перемен")))
    }
}
