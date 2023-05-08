//
//  SearchScrollView.swift
//  Reasce Line
//
//  Created by Andrew on 04.05.2023.
//

import SwiftUI

struct SearchScrollView: View {
    @StateObject var story: Story
    @Binding var firstMessageText: String
    var botAnswerCreatorView: BotAnswerCreatorView
    @State var nestingLevel: Int
    var body: some View {
        
        HStack(spacing: CGFloat(nestingLevel)*15+29){
            Text("")
            ScrollView(.vertical) {
               
                    VStack(spacing: 5){
                        ForEach(Array(story.allStoryNodesDictionary.values).filter{$0.getFirstMessageText().lowercased().hasPrefix(firstMessageText.lowercased()) || firstMessageText == ""}, id:\.self){ node in
                            
                            Button(action: { botAnswerCreatorView.changeStoryNode(newStoryNodeId: node.id)})
                            {
                                HStack{
                                    Text(node.getFirstMessageText())
                                    Spacer()
                                    Text("#"+String(node.id))
                                }
                            }
                            
                            
                        }
                    }
                
            }.frame(minHeight: 20, idealHeight: 100, maxHeight: 100).frame(width: 250).background(.thickMaterial).cornerRadius(5)
                Spacer()
        }
        
    }
        
}


struct SearchScrollView_Previews: PreviewProvider {
    static var previews: some View {
        Text("aaa")
        //var a : String = "a"
        //SearchScrollView(story: Story(id: 1, author: "Andrew" , profileName: "Эрих Мария Ремарк", profileImageUrl: "https://amiel.club/uploads/posts/2022-03/1647762836_1-amiel-club-p-kartinki-litsa-cheloveka-1.jpg", firstMessageText: "На Западном фронте без перемен"),firstMessageText: a, nestingLevel: 0)
    }
}
