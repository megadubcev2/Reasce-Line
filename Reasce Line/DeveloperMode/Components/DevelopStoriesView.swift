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
    @State var isVisible : Bool = true
    
    var body: some View {
        if(isVisible){
                VStack {
                    HStack{
                        Button(action: {
                            storiesArray.addNewStory()
                        })
                    {
                        
                        Image(systemName: "plus")
                    }.padding()
                        
                        Spacer()

                        Button(action: {
                            saveAllStories()
                        })
                    {
                        Text("Сохранить")
                    }.padding()
                        
                    }
                    ScrollView{
                        ForEach(storiesArray.stories, id:\.self){
                            story in DevelopStoryBlockView(story: story, developStoriesView: self)
                        }
                    }
                }
        }
    }
    
    public func deleteStory(storyId : Int){
        DispatchQueue.main.asyncAfter(deadline: .now()){
            storiesArray.deleteStory(storyId: storyId)
            isVisible.toggle()
            isVisible.toggle()
        }
    }
    
    public func saveAllStories(){
        ChatsController.update(storiesArray: storiesArray)
        //DevelopStoriesArrayController.pushStoriesToJsonFile()
    }
    
    
}

struct DevelopStoriesView_Previews: PreviewProvider {
    static var previews: some View {
        DevelopStoriesView()
    }
}
