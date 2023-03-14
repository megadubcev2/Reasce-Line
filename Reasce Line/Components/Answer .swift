//
//  Answer .swift
//  Reasce Line
//
//  Created by Алексей Королёв on 05.02.2023.
//

import SwiftUI

struct Answer_: View {
    var message: Message
    var body: some View {
        Button{
            
        } label: {
            Text(message.text).foregroundColor(.black).padding()
        }.frame(maxWidth: .infinity).background(.white).cornerRadius(20).padding()
    }
}

struct Answer__Previews: PreviewProvider {
    static var previews: some View {
        Answer_(message: Message(id: "12", text: "sdfdsg", received: true, timestamp: Date()))
    }
}
