//
//  DevelopChatsController.swift
//  Reasce Line
//
//  Created by Andrew on 18.04.2023.
//

import Foundation

public class DevelopStoriesArrayController{
    private static var developStoriesController : DevelopStoriesController = DevelopStoriesController()
    private static var stories : [Story] = developStoriesController.stories

    public static var storiesArray : StoriesArray = StoriesArray(stories: stories)
    
}
