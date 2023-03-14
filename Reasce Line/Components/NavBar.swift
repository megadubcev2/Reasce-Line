//
//  NavBar.swift
//  Reasce Line
//
//  Created by Алексей Королёв on 11.03.2023.
//

import SwiftUI

struct NavBar: View {
    let text: Text
    var body: some View {
        VStack {
            HStack {
                Spacer()
                NavigationLink {
                    SettingsScreen()
                        .navigationTitle("Настройки")
                } label: {
                    Text("Настройки")
                }
            }
            HStack {
                text
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
        }
        .padding([.horizontal], 16)
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar(text: Text("Новыe"))
    }
}
