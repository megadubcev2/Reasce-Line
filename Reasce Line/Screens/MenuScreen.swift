//
//  MenuScreen.swift
//  Reasce Line
//
//  Created by Алексей Королёв on 06.02.2023.
//

import SwiftUI

struct MenuScreen: View {
    var body: some View {
        NavigationStack {
            TabView {
                VStack {
                    NavBar(text: Text("Активные"))
                    Spacer()
                    ActiveStories()
                    Spacer()
                }
                .tabItem {
                    Label("Активные", systemImage: "tray.and.arrow.down.fill")
                }
                .toolbar(.visible, for: .tabBar)

                    .toolbarBackground(
                        Color.black,
                        for: .tabBar)
                VStack {
                    NavBar(text: Text("Новые"))
                    Spacer()
                    NewStories()
                    Spacer()
                }
                .tabItem {
                    Label("Новые", systemImage: "tray.and.arrow.up.fill")
                }
                .toolbar(.visible, for: .tabBar)

                    .toolbarBackground(
                        Color.black,
                        for: .tabBar)
                VStack {
                    NavBar(text: Text("Завершенные"))
                    Spacer()
                    CompletedStories()
                    Spacer()
                }
                .tabItem {
                    Label("Завершенные", systemImage: "person.crop.circle.fill")
                }
                .toolbar(.visible, for: .tabBar)

                    .toolbarBackground(
                        Color.black,
                        for: .tabBar)
            }
        }

    }
}

struct MenuScreen_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreen()
    }
}
