//
//  DevelopTitleRow.swift
//  Reasce Line
//
//  Created by Andrew on 13.05.2023.
//



import SwiftUI

struct DevelopTitleRow: View {
    var img : String
    var name : String
    var body: some View {
        HStack{
            
            Text("     ").font(.system(size: 25)).bold()
            Spacer()
            VStack(){
                Text(name).font(.system(size: 25)).bold()
                Text("Online").font(.caption).foregroundColor(.gray)
            }
            
            Spacer()
            
            AsyncImage(url: URL(string: img)){
                image in image.resizable().aspectRatio(contentMode: .fill).aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .cornerRadius(40)
            }placeholder: {
                ProgressView()
            }.padding(10)
            
        }
    }
}

struct DevelopTitleRow_Previews: PreviewProvider {
    static var previews: some View {
        DevelopTitleRow(img: "https://amiel.club/uploads/posts/2022-03/1647762836_1-amiel-club-p-kartinki-litsa-cheloveka-1.jpg", name : "Нина Жучкова")
    }
}
