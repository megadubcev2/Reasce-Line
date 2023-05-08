//
//  DevelopMessageBubble.swift
//  Reasce Line
//
//  Created by Andrew on 07.05.2023.
//

import SwiftUI

struct DevelopMessageBubble: View {
    var developBotMessagesScreen : DevelopBotMessagesScreen
    @State var message: Message
    var body: some View {
        VStack(alignment: message.sender == .bot ? .leading : .trailing){
            HStack{
                Text(message.text).padding()
                    .background(message.sender == .bot ? Color("fMessage") : Color("Color"))
                    .cornerRadius(40)
                
                Button(action: {
                    developBotMessagesScreen.deleteMessage(messageId: message.id)
                    })
                {
                    Image(systemName: "trash").foregroundColor(.red)
                }
                
            }
            .frame(maxWidth: 300, alignment: message.sender == .bot ? .leading:.trailing)
        }.frame(maxWidth: .infinity,alignment: message.sender == .bot ? .leading : .trailing)
            .padding(message.sender == .bot ? .leading: .trailing)
            .padding(.horizontal,10)
    }
}

struct DevelopMessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        Text("a")
        //DevelopMessageBubble(developBotMessagesScreen: DevelopBotMessagesScreen(story: <#Story#>, storyNodeId: <#Int#>), message: Message(text: "шшш", sender: .bot))
    }
}
