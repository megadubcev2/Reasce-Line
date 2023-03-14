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
                Button{
                    
                }label: {
                    Text("Режим разработчика").foregroundColor(.black).frame(maxWidth: .infinity,alignment: .leading).padding().background(Color("Color"))
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
