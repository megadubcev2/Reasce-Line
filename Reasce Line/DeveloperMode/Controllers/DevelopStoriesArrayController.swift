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
    
//    public static func pushStoriesToJsonFile(){
//        
//        if let encodedData = try? JSONEncoder().encode(storiesArray) {
//            
//            guard let path = Bundle.main.path(forResource: "sample1", ofType: "json") else {
//                print("не нашли путь")
//                return
//            }
//            print("нашли")
//            print(encodedData)
//            let pathAsURL = URL(fileURLWithPath: path)
//            do {
//                try encodedData.write(to: pathAsURL)
//                print("aaa")
//
//                
//            }
//            catch {
//                print("Failed to write JSON data: \(error.localizedDescription)")
//            }
//        }
//        else{
//            print("ошибка инкодинга")
//        }
//    }
    
}


//if let newstoriesArray = try? JSONDecoder().decode(StoriesArray.self, from: encodedData){
 //   print(newstoriesArray.stories[0].id)
//}



//                if let path = Bundle.main.path(forResource: "c", ofType: "json") {
//                    do {
//                          let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//                          let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
//                          if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let aaarayStories = jsonResult["aaarayStories"] as? [Any] {
//                                    // do stuff
//                          }
//                      } catch {
//                           // handle error
//                      }
//                }
