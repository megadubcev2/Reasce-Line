//
//  Chat.swift
//  Reasce Line
//
//  Created by Andrew on 13.03.2023.
//

import Foundation

public class Chat : ObservableObject{
    
    
    private var story : Story
    @Published var dialogHistory: [Message]
    @Published var profileName: String
    @Published var profileImageUrl: String
    @Published var storyNodeNow: StoryNode
    @Published var playerAnswersNow: [PlayerAnswer]
    
    init(story: Story) {
        self.story = story
        self.dialogHistory = []
        self.profileName = story.profileName
        self.profileImageUrl = story.profileImageUrl
        storyNodeNow =  story.getStoryNodeById(id: story.getFirstStoryNodeId())!
        playerAnswersNow = []
        playerAnswersNow = storyNodeNow.playerAnswers
        
        dialogHistory.append(storyNodeNow.botMessages[0])
    }
    
    public func getStory() -> Story{
        return story
    }
    
    public func chooseAnswer (chosenAnswer: PlayerAnswer){
        //print(chosenAnswer.nextStoryNodeID)
        playerAnswersNow = []
        
        dialogHistory.append(chosenAnswer.getMessage())
        
        storyNodeNow = story.getStoryNodeById(id: chosenAnswer.nextStoryNodeID)!
        
        for botMessage in storyNodeNow.botMessages {
            //type(message: botMessage)
            dialogHistory.append(botMessage)
        }
        
        playerAnswersNow = storyNodeNow.playerAnswers
    }
    
    private func type(message: Message){
//        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(message.timeToWait)) {
//            self.dialogHistory.append(Message(text: "●○○", sender: .bot))
//        }
//        for _ in 0...(message.timeToWrite+2)/3{
//
//                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)){
//                    self.dialogHistory.append(Message(text: "○●○", sender: .bot))
//            }
//            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)){
//                    self.dialogHistory.append(Message(text: "○○●", sender: .bot))
//            }
//            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)){
//                self.dialogHistory.append(Message(text: "●○○", sender: .bot))
//            }
//        }
        //dialogHistory[dialogHistory.count-1] = message
    }
}

extension Chat: Hashable {
    public static func == (lhs: Chat, rhs: Chat) -> Bool {
        return lhs.getStory().id == rhs.getStory().id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(getStory().id)
    }
}
