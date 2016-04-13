//
//  Groups.swift
//  NewInstantRating
//
//  Created by Aaron Eliason on 4/12/16.
//  Copyright © 2016 IlasonApps. All rights reserved.
//

import Foundation

class Groups {
    private let kGroupName = "groupName"
    private let kQuestionID = "quesionID"
    private let kHostUserID = "hostUserID"
    private let kuserIDs = "userIDs"
    
    var groupName: String
    var userIDs: [String]
    var questionID: String
    var hostUserID: String
    var identifier: String?
    var endpoint: String{
        return "groups"
    }
    
    var jsonValue: [String: AnyObject] {
        var json: [String: AnyObject] = [kGroupName: groupName, kQuestionID: questionID, kHostUserID: hostUserID]
        json.updateValue(userIDs, forKey: kuserIDs)
        return json
    }
    
    init?(json: [String:AnyObject], identifier: String) {
        guard let groupNameID = json[kGroupName] as? String,
        let userIDs = json [kuserIDs] as? [String],
        let questionID = json[kQuestionID] as? String,
            let hostUserID = json[kHostUserID] as? String else {return nil}
        
        self.groupName = groupNameID
        self.userIDs = userIDs
        self.questionID = questionID
        self.hostUserID = hostUserID
        self.identifier = identifier
    }
    
    init(groupName: String, questionID: String, hostUserID: String, userIDs: [String]) {
        self.groupName = groupName
        self.questionID = questionID
        self.hostUserID = hostUserID
        self.userIDs = userIDs
    }
}
