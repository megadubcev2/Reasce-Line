//
//  StoriesArray.swift
//  Reasce Line
//
//  Created by Andrew on 18.04.2023.
//

import Foundation
public class StoriesArray: ObservableObject{
    @Published var stories : [Story]
    init(stories : [Story]) {
        self.stories = stories
    }
}
