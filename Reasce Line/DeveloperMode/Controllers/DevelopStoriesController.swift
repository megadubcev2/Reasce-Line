//
//  DevelopStoriesController.swift
//  Reasce Line
//
//  Created by Andrew on 18.04.2023.
//

import Foundation

public class DevelopStoriesController{
    public var stories : [Story]
    public var storiesArray : StoriesArray
    
    public init(){
        stories = []
        
        var story = Story(id: 1, author: "andrew", profileName: "Иннокентий", profileImageUrl: "https://amiel.club/uploads/posts/2022-03/1647762836_1-amiel-club-p-kartinki-litsa-cheloveka-1.jpg", firstMessageText: "помогите")
        
        //2
        story.addStoryNode(botMessageTexts: ["меня зовут Иннокентий", "мне очень страшно.."])
        
        //3
        story.addStoryNode(botMessageTexts: ["вы не поверите но я похоже в гробу", "у меня очень болит голова", "я нашел телефон в кармане, тут есть ваше приложение"])
        
        //4
        story.addStoryNode(botMessageTexts: ["что случилось?", "эх если бы я знал..", "я очнулся в гробу","у меня очень болит голова", "я нашел телефон в кармане, тут есть ваше приложение"])
        
        //5
        story.addStoryNode(botMessageTexts: ["хорошо я попробую"])
        
        //6
        story.addStoryNode(botMessageTexts: ["ничего не произошло", "но теперь у меня еще сильнее закружилась голова"])
        
        //7
        story.addStoryNode(botMessageTexts: ["ничего абсолютно!", "как топором отрезало"])
        
        //8
        story.addStoryNode(botMessageTexts: ["секунду..", "ого зажигалка", "сейчас зажгу, осмотрюсь, а то темно как в шахте"])
        
        //9
        story.addStoryNode(botMessageTexts: ["ВЫ ПРОИГРАЛИ!!"])
        
        //10
        story.addStoryNode(botMessageTexts: ["Хорошо"])
        
        
        
        
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
        
        story.addPlayerAnswerToStoryNode(storyNodeId: 4,
                                         playerAnswerText: "Что вы последнее помните, перед тем как очнулись?", nextStoryNodeId: 7)
        
        story.addPlayerAnswerToStoryNode(storyNodeId: 4,
                                         playerAnswerText: "Попробуйте покричать, вдруг кто-то услышит и поможет", nextStoryNodeId: 5)
        
        story.addPlayerAnswerToStoryNode(storyNodeId: 4,
                                         playerAnswerText: "Осмотрите внимательно карманы", nextStoryNodeId: 8)
        
        story.addPlayerAnswerToStoryNode(storyNodeId: 5,
                                         playerAnswerText: "как успехи?", nextStoryNodeId: 6)
        
        story.addPlayerAnswerToStoryNode(storyNodeId: 3,
                                         playerAnswerText: "Что вы последнее помните, перед тем как очнулись?", nextStoryNodeId: 7)
        
        story.addPlayerAnswerToStoryNode(storyNodeId: 3,
                                         playerAnswerText: "Попробуйте покричать, вдруг кто-то услышит и поможет", nextStoryNodeId: 5)
        
        story.addPlayerAnswerToStoryNode(storyNodeId: 3,
                                         playerAnswerText: "Осмотрите внимательно карманы", nextStoryNodeId: 8)
        
        

        
        story.addPlayerAnswerToStoryNode(storyNodeId: 7,
                                         playerAnswerText: "Попробуйте покричать, вдруг кто-то услышит и поможет", nextStoryNodeId: 5)
        
        story.addPlayerAnswerToStoryNode(storyNodeId: 7,
                                         playerAnswerText: "Осмотрите внимательно карманы", nextStoryNodeId: 8)
        
        
        story.addPlayerAnswerToStoryNode(storyNodeId: 6,
                                         playerAnswerText: "Что вы последнее помните, перед тем как очнулись?", nextStoryNodeId: 7)
        
        
        story.addPlayerAnswerToStoryNode(storyNodeId: 6,
                                         playerAnswerText: "Осмотрите внимательно карманы", nextStoryNodeId: 8)
        
        
        story.addPlayerAnswerToStoryNode(storyNodeId: 8,
                                         playerAnswerText: "Да отличная идея", nextStoryNodeId: 9)
        
        story.addPlayerAnswerToStoryNode(storyNodeId: 8,
                                         playerAnswerText: "нет ни в коем случае!!!", nextStoryNodeId: 10)
        
        
        //print(story.allStoryNodesDictionary)
        
        stories.append(story)
        
        var story2 = Story(id: 2, author: "andrew", profileName: "Нина Жучкова", profileImageUrl: "https://amiel.club/uploads/posts/2022-03/1647762836_1-amiel-club-p-kartinki-litsa-cheloveka-1.jpg", firstMessageText: "ПОМОГИТЕ!!!")
            
        //2
        story2.addStoryNode(botMessageTexts: ["эх..."])
        
        story2.addPlayerAnswerToStoryNode(storyNodeId: 1,
                                         playerAnswerText: "Извините у меня обед",
        nextStoryNodeId: 2)
        story2.addPlayerAnswerToStoryNode(storyNodeId: 1,
                                         playerAnswerText: "Пойми все проблемы у тебя в голове",
        nextStoryNodeId: 2)
        story2.addPlayerAnswerToStoryNode(storyNodeId: 1,
                                         playerAnswerText: "Кто ты? Откуда у тебя мой номер???",
        nextStoryNodeId: 2)
        
        story2.addPlayerAnswerToStoryNode(storyNodeId: 2,
                                         playerAnswerText: "Начать заново", nextStoryNodeId: 1)
        
        stories.append(story2)
        
        storiesArray = StoriesArray(stories: stories)
    }
}
