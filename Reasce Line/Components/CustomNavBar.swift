//
//  CustomNavBar.swift
//  Reasce Line
//
//  Created by Алексей Королёв on 06.02.2023.
//

import SwiftUI

struct CustomNavBar: View {
    var body: some View {
        HStack{
            ButtonNavBarItem(text: Text("Активные")) {}
            ButtonNavBarItem(text: Text("Новые")) {}
            ButtonNavBarItem(text: Text("Пройденные")) {}
        }
        .padding()
        .background(.black)

    }
}

struct CustomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBar()
    }
}

struct ButtonNavBarItem: View {
    let text: Text
    let action: ()-> Void
    var body: some View {
        NavigationLink(destination: MenuScreen(), label: {
            VStack{
                switch text{
                case Text("Активные"):
                    Image("image1").resizable().frame(width: 30,height: 30)
                case Text("Новые"):
                    Image("image3").resizable().frame(width: 30,height: 30)
                case Text("Пройденные"):
                    Image("image2").resizable().frame(width: 30,height: 30)
                default:
                    Image("image3").resizable().frame(width: 30,height: 30)
                }
                text.font(.subheadline).foregroundColor(Color.white).frame(maxWidth: .infinity)
            }
        })
    }
}
