//
//  DevelopStoryScreen.swift
//  Reasce Line
//
//  Created by Andrew on 18.04.2023.
//

import SwiftUI

struct DevelopStoryScreen: View {

    @StateObject var story : Story
    
    var body: some View {
        //VStack{
           // NavigationView{
                VStack{
                    ScrollView(.horizontal){
                        ScrollView(.vertical) {
                            BotAnswerCreatorView(story: story, storyNodeId: story.getFirstStoryNodeId(), nestingLevel: 0, lastPlayerAnswer: nil)
                        }
                    }
                    Spacer()
                }
                
            //}
       // }
    }
}

struct DevelopStoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        DevelopStoryScreen(story: Story(id: 1, author: "Andrew" , profileName: "Эрих Мария Ремарк", profileImageUrl: "https://amiel.club/uploads/posts/2022-03/1647762836_1-amiel-club-p-kartinki-litsa-cheloveka-1.jpg", firstMessageText: "На Западном фронте без перемен"))
    }
}
