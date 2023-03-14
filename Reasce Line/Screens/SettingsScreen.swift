//
//  SettingsScreen.swift
//  Reasce Line
//
//  Created by Алексей Королёв on 08.02.2023.
//

import SwiftUI

struct SettingsScreen: View {
    var body: some View {
            VStack(spacing: 0){
                SimpleToggle(name: "Музыка")
                SimpleToggle(name: "Звук")
                NavigationLink {
                    RegisrtationScreen()
                } label: {
                    Text("Режим разработчика").foregroundColor(.white).frame(maxWidth: .infinity,alignment: .leading).padding().background(.black)
                }
                Spacer()
            }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
