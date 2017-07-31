//
//  Story.swift
//  Tweetie
//
//  Created by Jeremy Seibert on 7/29/17.
//  Copyright © 2017 Jeremy Seibert. All rights reserved.
//

import Foundation
import Firebase

class Story
{
    var photoURL = ""
    var text = ""
    var numberOfLikes = 0
    var numberOfAngry = 0
    let ref: FIRDatabaseReference!
    
    private let storiesRef = FIRDatabase.database().reference().child("stories")
    
    init(text: String) {
        self.text = text
        ref = storiesRef.childByAutoId()
    }
    
    init(snapshot: FIRDataSnapshot)
    {
        ref = snapshot.ref
        if let value = snapshot.value as? [String : Any] {
            text = value["text"] as! String
            numberOfLikes = value["numberOfLikes"] as! Int
            numberOfAngry = value["numberOfAngry"] as! Int
        } else {
            numberOfAngry = 0
            numberOfLikes = 0
        }
    }
    
    func save() {
        ref.setValue(toAny())
    }
    
    func toAny() -> Any {
        return [
            "text" : text,
            "numberOfLikes" : numberOfLikes,
            "numberOfAngry" : numberOfAngry
        ]
    }
}

extension Story {
    func like() {
        numberOfLikes += 1
        ref.child("numberOfLikes").setValue(numberOfLikes)
    }
}













