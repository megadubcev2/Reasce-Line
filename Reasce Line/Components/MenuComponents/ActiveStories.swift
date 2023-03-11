//
//  ActiveStories.swift
//  Reasce Line
//
//  Created by Алексей Королёв on 10.03.2023.
//

import SwiftUI

struct ActiveStories: View {
    var text  = Text("Активные")
    var storyArray = ["R,D","Эрих Мария Ремар","AGADFGAFDGDG","Эрих Мария Ремар","Эрих Мария Ремар","Эрих Мария Ремар","Эрих Мария Ремар","Эрих Мария Ремар","Эрих Мария Ремар"]
    var body: some View {
            ZStack {
                VStack {
                    ScrollView{
                            ForEach(storyArray, id:\.self){
                                story in StoryBlock(story: Story(id: "1", author: story, ImageUrl: "https://amiel.club/uploads/posts/2022-03/1647762836_1-amiel-club-p-kartinki-litsa-cheloveka-1.jpg", name: "На Западном фронте без перемен"))
                            }
                    }
                }
                }
    }
}

struct ActiveStories_Previews: PreviewProvider {
    static var previews: some View {
        ActiveStories()
    }
}
