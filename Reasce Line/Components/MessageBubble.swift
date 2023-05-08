//
//  MessageBubble.swift
//  Reasce Line
//
//  Created by Алексей Королёв on 05.02.2023.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
 //   @State private var ShowTime = false
    var body: some View {
        VStack(alignment: message.sender == .bot ? .leading : .trailing){
            HStack{
                Text(message.text).padding()
                    .background(message.sender == .bot ? Color("fMessage") : Color("Color"))
                    .cornerRadius(40)
            }
            .frame(maxWidth: 300, alignment: message.sender == .bot ? .leading:.trailing)
//            .onTapGesture {
//                ShowTime.toggle()
//            }
//            if ShowTime {
//                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
//                    .font(.caption2)
//                    .foregroundColor(.gray)
//                    .padding(message.sender == .player ? .leading : .trailing,25)
//            }
        }.frame(maxWidth: .infinity,alignment: message.sender == .bot ? .leading : .trailing)
            .padding(message.sender == .bot ? .leading: .trailing)
            .padding(.horizontal,10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(text: "шшш", sender: .player))
    }
}
