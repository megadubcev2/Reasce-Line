//
//  Story.swift
//  Reasce Line
//
//  Created by Алексей Королёв on 06.02.2023.
//

import Foundation

public struct Story : Identifiable, Codable{
    public var id: String
    public var author: String
    public var profileName : String
    public var profileImageUrl: String
    public var firstStoryNode: StoryNode
    public var allStoryNodesDictionary: [Int: StoryNode]
}
