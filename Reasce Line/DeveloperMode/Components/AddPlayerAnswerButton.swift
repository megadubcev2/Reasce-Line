//
//  AddPlayerAnswerButton.swift
//  Reasce Line
//
//  Created by Andrew on 06.05.2023.
//


import SwiftUI

struct AddPlayerAnswerButton: View {
    var botAnswerCreatorView: BotAnswerCreatorView
    @State var nestingLevel: Int
    var body: some View {
        
        HStack(spacing: CGFloat(nestingLevel)*25+35){
            Text("")
            Button(action: {
                botAnswerCreatorView.addNewPlayerAnswer()
                
            })
            {
                Text("Добавить вариант ответа")
            }
            Spacer()
        }
        
    }
        
}


struct AddPlayerAnswerButton_Previews: PreviewProvider {
    static var previews: some View {
        Text("aaa")
        //var a : String = "a"
        //SearchScrollView(story: Story(id: 1, author: "Andrew" , profileName: "Эрих Мария Ремарк", profileImageUrl: "https://amiel.club/uploads/posts/2022-03/1647762836_1-amiel-club-p-kartinki-litsa-cheloveka-1.jpg", firstMessageText: "На Западном фронте без перемен"),firstMessageText: a, nestingLevel: 0)
    }
}
