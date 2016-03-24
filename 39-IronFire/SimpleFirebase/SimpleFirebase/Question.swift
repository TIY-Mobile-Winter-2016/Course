//
//  Question.swift
//  SimpleFirebase
//
//  Created by Phil Wright on 3/23/16.
//  Copyright © 2016 Touchopia, LLC. All rights reserved.
//

import Foundation
import Firebase

class Question {
    
    var questionKey: String = ""
    var image: UIImage?
    var imageBase64: String = ""
    var title: String = ""
    var answerA: String = ""
    var answerB: String = ""
    var answerC: String = ""
    var answerD: String = ""
    
    var questionRef = Firebase(url: "https://ironfire.firebaseio.com/questions")
    
    init() {
        
    }
    
    init(key: String, dict: Dictionary<String, AnyObject>) {
        
        self.questionKey = key
        
        if let title = dict["title"] as? String {
            self.title = title
        }
        
        if let answerA = dict["answerA"] as? String {
            self.answerA = answerA
        }
        
        if let answerB = dict["answerB"] as? String {
            self.answerB = answerB
        }
        
        if let answerC = dict["answerC"] as? String {
            self.answerC = answerC
        }
        
        if let answerD = dict["answerD"] as? String {
            self.answerD = answerD
        }
        
        self.questionRef = self.questionRef.childByAppendingPath(self.questionKey)
        
    }
    
    func addImage(theImage: UIImage) {
        let data = UIImageJPEGRepresentation(theImage,0.1)!
        self.imageBase64 = data.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
    }
    
    func getImage() -> UIImage? {
        
        if let decodedData = NSData(base64EncodedString: imageBase64, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters) {
            return UIImage(data: decodedData)
        }
        return nil
    }
    
    func save() {
        
        let dict: Dictionary<String, AnyObject> = [
            "title": self.title,
            "answerA": self.answerA,
            "answerB": self.answerB,
            "answerC": self.answerC,
            "answerD": self.answerD
        ]
        
        
        let firebaseQuestion = self.questionRef.childByAutoId()
        firebaseQuestion.setValue(dict)
    }

}