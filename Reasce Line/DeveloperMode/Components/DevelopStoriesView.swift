//
//  DevelopStoriesView.swift
//  Reasce Line
//
//  Created by Andrew on 18.04.2023.
//

import SwiftUI

struct DevelopStoriesView: View {
    var text  = Text("Активные")
    @StateObject var storiesArray = DevelopStoriesArrayController.storiesArray
    
//    var storyArray = ["R,D","Эрих Мария Ремар","AGADFGAFDGDG","Эрих Мария Ремар","Эрих Мария Ремар","Эрих Мария Ремар","Эрих Мария Ремар","Эрих Мария Ремар","Эрих Мария Ремар"]
    
    var body: some View {
            ZStack {
                VStack {
                    ScrollView{
                        ForEach(storiesArray.stories, id:\.self){
                                story in DevelopStoryBlockView(story: story)
                            }
                    }
                }
                }
    }
}

struct DevelopStoriesView_Previews: PreviewProvider {
    static var previews: some View {
        DevelopStoriesView()
    }
}
