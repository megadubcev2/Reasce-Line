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
    @Published var playerAnswersNowId: [Int]
    //@Published var isVisiblePlayerAnswers: Bool
    @Published var status: String
    
    init(story: Story) {
        self.story = story
        self.dialogHistory = []
        self.profileName = story.profileName
        self.profileImageUrl = story.profileImageUrl
        status = "Online"
        //isVisiblePlayerAnswers = true
        storyNodeNow =  story.getStoryNodeById(id: story.getFirstStoryNodeId())
        playerAnswersNowId = []
        playerAnswersNowId = storyNodeNow.playerAnswersId
        
        dialogHistory.append(storyNodeNow.getFirstMessage())
        
    }
    
    public func getStory() -> Story{
        return story
    }
    
    public func chooseAnswer (chosenAnswer: PlayerAnswer){
        //print(chosenAnswer.nextStoryNodeID)
        playerAnswersNowId = []
        
        dialogHistory.append(chosenAnswer.getMessage())
        
        storyNodeNow = story.getStoryNodeById(id: chosenAnswer.nextStoryNodeId)
        var delaySeconds = 0.0
        
        for botMessage in storyNodeNow.botMessages {
            delaySeconds += botMessage.timeToWrite
            type(message: botMessage, delaySeconds: delaySeconds)
            //dialogHistory.append(botMessage)
            //dialogHistory.append
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + delaySeconds+1) {
            self.playerAnswersNowId = self.storyNodeNow.playerAnswersId
        }
        changeStatusType(delaySeconds: delaySeconds)
    }
    
    private func changeStatusType(delaySeconds : Double){
        var timesRepeat = Int((delaySeconds / 1.2)) + 1
        for i in 0...timesRepeat-1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2 * Double(i)) {
                self.status = "Печатает."
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2 * Double(i) + 0.4) {
                self.status = "Печатает.."
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2 * Double(i) + 0.8) {
                self.status = "Печатает..."
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2 * Double(timesRepeat)) {
            self.status = "Online"
        }
    }
    
    private func type(message: Message, delaySeconds : Double){
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
        DispatchQueue.main.asyncAfter(deadline: .now() + delaySeconds) {
                   self.dialogHistory.append(message)
               }
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
