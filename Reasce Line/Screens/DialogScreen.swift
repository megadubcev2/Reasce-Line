//
//  DialogScreen.swift
//  Reasce Line
//
//  Created by Алексей Королёв on 06.02.2023.
//

import SwiftUI

struct DialogScreen: View {
    var messageArray = ["лдь", "How are tou", "dfgfgafdgajgndfjgbsjdkfbgsdfbgjbfsgbfdsbgjfdbgjbsfdjgbjsfdbgjbdjksgbfjsdbgfdbjkgbfdjgjagjabdgbdajgbfdgfadg"]
    var answerArray = ["лдь", "How are tou","fdgdaкциппкцикци"]
    var body: some View {
        VStack {
            VStack{
                ScrollView{
                    ForEach(messageArray, id:\.self){
                        text in MessageBubble(message: Message(id: "1", text: text, received: true, timestamp: Date()))
                    }
                    ForEach(messageArray, id:\.self){
                        text in MessageBubble(message: Message(id: "1", text: text, received: false, timestamp: Date()))
                    }
                }
                .padding(.top,10)
                .background(.white)
                .cornerRadius(50, corners: [.topLeft,.topRight])
            }.background(Color("Color"))
                VStack(spacing: -25){
                    ForEach(answerArray, id:\.self){
                        text in Answer_(message: Message(id: "1", text: text, received: true, timestamp: Date()))
                    }
                }.background(Color("fMessage")).padding(.top,-9)
        
        }
    }
}

struct DialogScreen_Previews: PreviewProvider {
    static var previews: some View {
        DialogScreen()
    }
}
