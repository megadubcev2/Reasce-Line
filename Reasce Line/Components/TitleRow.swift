//
//  TitleRow.swift
//  Reasce Line
//
//  Created by Алексей Королёв on 05.02.2023.
//

import SwiftUI

struct TitleRow: View {
    @StateObject var chat : Chat
    var body: some View {
        HStack{
            
            Text("     ").font(.system(size: 25)).bold()
            Spacer()
            VStack(){
                Text(chat.profileName).font(.system(size: 25)).bold()
                Text(chat.status).font(.caption).foregroundColor(.gray)
            }
            
            Spacer()
            
            AsyncImage(url: URL(string: chat.profileImageUrl)){
                image in image.resizable().aspectRatio(contentMode: .fill).aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .cornerRadius(40)
            }placeholder: {
                ProgressView()
            }.padding(10)
            
        }
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        Text("a")
        //TitleRow(chat : "Нина Жучкова")
    }
}
