//
//  SimpleToggle.swift
//  Reasce Line
//
//  Created by Алексей Королёв on 08.02.2023.
//

import SwiftUI

struct SimpleToggle: View {
    var name: String
    @State var isOn: Bool = false
    var body: some View {
       Toggle(isOn: $isOn, label: {
           Text(name)
       }).toggleStyle(SwitchToggleStyle(tint: Color("Color")))
            .padding().overlay{
                Rectangle().stroke(.gray,lineWidth: 1).padding(.horizontal,-15)
            }
    }
}

struct SimpleToggle_Previews: PreviewProvider {
    static var previews: some View {
        SimpleToggle(name: "Настройки")
    }
}
