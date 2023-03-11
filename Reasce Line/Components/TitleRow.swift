//
//  TitleRow.swift
//  Reasce Line
//
//  Created by Алексей Королёв on 05.02.2023.
//

import SwiftUI

struct TitleRow: View {
    var img = URL(string: "https://amiel.club/uploads/posts/2022-03/1647762836_1-amiel-club-p-kartinki-litsa-cheloveka-1.jpg")
    var name = "Nina Jushkova"
    var body: some View {
        HStack{
            Button{
            } label: {
                Image(systemName: "chevron.backward").font(.system(size: 26).bold()).foregroundColor(Color.blue).padding(15)
            }
            
            Spacer()
            
            VStack(){
                Text(name).font(.system(size: 25)).bold()
                Text("Online").font(.caption).foregroundColor(.gray)
            }
            
            Spacer()
            
            AsyncImage(url: img){
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
        TitleRow().background(Color("Color"))
    }
}
