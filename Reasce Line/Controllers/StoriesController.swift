//
//  StoriesController.swift
//  Reasce Line
//
//  Created by Andrew on 13.03.2023.
//

import Foundation

public class StoriesController{
    public var stories : [Story]
    
    public init(){
        stories = []
        
        var story = Story(id: 1, author: "andrew", profileName: "Иннокентий", profileImageUrl: "https://amiel.club/uploads/posts/2022-03/1647762836_1-amiel-club-p-kartinki-litsa-cheloveka-1.jpg", firstMessageText: "помогите")
        
        //2
        story.addStoryNode(botMessageTexts: ["меня зовут иннокентий", "мне очень страшно.."])
        
        //3
        story.addStoryNode(botMessageTexts: ["вы не поверите но я похоже в гробу", "у меня очень болит голова", "я нашел телефон в кармане, тут есть ваше приложение"])
        
        //4
        story.addStoryNode(botMessageTexts: ["что случилось?", "эх если бы я знал..", "я очнулся в гробу","у меня очень болит голова", "я нашел телефон в кармане, тут есть ваше приложение"])
        
        //5
        story.addStoryNode(botMessageTexts: ["хорошо я попробую"])
        
        //6
        story.addStoryNode(botMessageTexts: ["ничего не произошло", "но теперь у меня еще сильнее закружилась голова"])
        
        
        story.addPlayerAnswerToStoryNode(storyNodeId: 1,
                                         playerAnswerText: "здравствуйте, представьтесь",
        nextStoryNodeId: 2)
        
        story.addPlayerAnswerToStoryNode(storyNodeId: 1,
                                         playerAnswerText: "можно поподробнее? где вы находитесь?", nextStoryNodeId: 3)
        
        story.addPlayerAnswerToStoryNode(storyNodeId: 1,
                                         playerAnswerText: "что случилось?", nextStoryNodeId: 4)
        
        story.addPlayerAnswerToStoryNode(storyNodeId: 2,
                                         playerAnswerText: "Иннокентий, что случилось?", nextStoryNodeId: 4)
        story.addPlayerAnswerToStoryNode(storyNodeId: 2,
                                         playerAnswerText: "Иннокентий, где вы находитесь?", nextStoryNodeId: 3)
        
        //print(story.allStoryNodesDictionary)
        
        stories.append(story)
        stories.append(story)
        stories.append(story)
        stories.append(story)


    }
}
