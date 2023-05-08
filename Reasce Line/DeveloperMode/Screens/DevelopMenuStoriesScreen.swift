//
//  menuCreatingStoriesScreen.swift
//  Reasce Line
//
//  Created by Andrew on 18.04.2023.
//


import SwiftUI

struct DevelopMenuStoriesScreen: View {
    var body: some View {
        NavigationStack {
            TabView {
                VStack {
                    NavBar(text: Text("Активные"))
                    Spacer()
                    DevelopStoriesView()
                    Spacer()
                }
                .tabItem {
                    Label("Активные", systemImage: "ellipsis.message")
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
                    Label("Новые", systemImage: "plus.message")
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
                    Label("Завершенные", systemImage: "checkmark.message")
                }
                .toolbar(.visible, for: .tabBar)

                    .toolbarBackground(
                        Color.black,
                        for: .tabBar)
            }
        }

    }
}

struct DevelopMenuSroriesScreen_Previews: PreviewProvider {
    static var previews: some View {
        DevelopMenuStoriesScreen()
    }
}
