//
//  StoryBlock.swift
//  Reasce Line
//
//  Created by Алексей Королёв on 06.02.2023.
//

import SwiftUI

struct StoryBlock: View {
    var story: Story
    var body: some View {
        NavigationLink(destination: DialogScreen(), label: {
            HStack{
                AsyncImage(url: URL(string: story.ImageUrl)){
                    image in image.resizable().aspectRatio(contentMode: .fill).aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .cornerRadius(40)
                }placeholder: {
                    ProgressView()
                }.padding(10)
                VStack(alignment: .leading){
                    Text(story.name).font(.title2).frame(maxHeight: 30).foregroundColor(.black)
                    Text(story.author).font(.caption).foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
            }.padding(.horizontal)
        })
    }
}

struct StoryBlock_Previews: PreviewProvider {
    static var previews: some View {
        StoryBlock(story: Story(id: "1", author: "Эрих Мария Ремарк", ImageUrl: "https://amiel.club/uploads/posts/2022-03/1647762836_1-amiel-club-p-kartinki-litsa-cheloveka-1.jpg", name: "На Западном фронте без перемен"))
    }
}
