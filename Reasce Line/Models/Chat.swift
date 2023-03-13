//
//  Chat.swift
//  Reasce Line
//
//  Created by Andrew on 13.03.2023.
//

import Foundation

public class Chat : Decodable{
    private var story : Story
    private var dialogHistory: [Message]
    private var profileName: String
    private var profileImageUrl: String
    private var storyNodeNow: StoryNode
    private var playerAnswersNow: [PlayerAnswer]
    
    init(story: Story) {
        self.story = story
        self.dialogHistory = []
        self.profileName = story.profileName
        self.profileImageUrl = story.profileImageUrl
        storyNodeNow = story.firstStoryNode
        playerAnswersNow = storyNodeNow.playerAnswers
    }
    
    public func chooseAnswer (chosenAnswer: PlayerAnswer){
        playerAnswersNow = []
        dialogHistory.append(chosenAnswer.message)
        
        storyNodeNow = story.allStoryNodesDictionary[chosenAnswer.nextStoryNodeID]
        
        for botMessage in storyNodeNow.botMessages {
            type(message: botMessage)
        }
        
        playerAnswersNow = storyNodeNow.playerAnswers
    }
    
    private func type(message: Message){
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(message.timeToWait)) {
            self.dialogHistory.append(Message(text: "●○○", sender: .bot))
        }
        for _ in 0...(message.timeToWrite+2)/3{
  
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)){
                    self.dialogHistory.append(Message(text: "○●○", sender: .bot))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)){
                    self.dialogHistory.append(Message(text: "○○●", sender: .bot))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)){
                self.dialogHistory.append(Message(text: "●○○", sender: .bot))
            }
        }
        dialogHistory[dialogHistory.count-1] = message
    }
}
