//
//  DevelopStoryBlockView.swift
//  Reasce Line
//
//  Created by Andrew on 18.04.2023.
//



import SwiftUI

struct DevelopStoryBlockView: View {
    @StateObject var story: Story
    var developStoriesView: DevelopStoriesView
        
    var body: some View {
        NavigationLink {
            DevelopStoryScreen(story: story)
                         .toolbar{
                             ToolbarItemGroup(placement: .principal, content: {
                                 
                                 DevelopTitleRow(img: story.profileImageUrl, name: story.profileName)
                             })
                         }
                 } label: {
            HStack{
                AsyncImage(url: URL(string: story.profileImageUrl)){
                    image in image.resizable().aspectRatio(contentMode: .fill).aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .cornerRadius(40)
                }placeholder: {
                    ProgressView()
                }.padding(10)
                //VStack(alignment: .leading){
                TextField("Имя пользователя", text: $story.profileName).textFieldStyle(.roundedBorder)//.frame(width: 250)//
                    .font(.title2).frame(maxHeight: 30)//.foregroundColor(.black)
                    //Text(Story.text).font(.caption).foregroundColor(.gray)
                //}
                .frame(maxWidth: 250)
                
                Button(action: {
                    developStoriesView.deleteStory(storyId: story.id)
                })
                    {
                        
                        Image(systemName: "trash").foregroundColor(.red)
                    }
                
                Spacer()
            }.padding(.horizontal)
                 }
    }
}

struct DevelopStoryBlockView_Previews: PreviewProvider {
    static var previews: some View {
        DevelopStoryBlockView(story: Story(id: 1, author: "Andrew" , profileName: "Эрих Мария Ремарк", profileImageUrl: "https://amiel.club/uploads/posts/2022-03/1647762836_1-amiel-club-p-kartinki-litsa-cheloveka-1.jpg", firstMessageText: "На Западном фронте без перемен"), developStoriesView: DevelopStoriesView())
    }
}
