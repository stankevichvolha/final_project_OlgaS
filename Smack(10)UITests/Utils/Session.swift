//
//  Session.swift
//  Smack(10)UITests
//
//  Created by Volha  Stankevich on 12/4/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import Foundation

class Session {
    static var shared: Session = .init()
    let email = "olga@test.com"
    let password = "123456"
    let name = "Olga"
    
    var account: [Account] = [
    Account(
        token: "TOKEN1",
        user: "olga@test.com"
            ),
    Account(
    token: "TOKEN2",
    user: "olga2@test.com"
        )
    ]
    var user: [User] = [
        User(id: "1", avatarColor: "[0.6666666666666666, 0.25098039215686274, 0.788235294117647, 1]", avatarName: "dark1", email: "olga@test.com", name: "Olga", _v: 0),
        User(id: "2", avatarColor: "[0.6666666666666666, 0.25098039215686274, 0.788235294117647, 1]", avatarName: "dark2", email: "olga2@test.com", name: "Olga2", _v: 0)
    ]
    
    var channel: [Channel] = [
        Channel(id: "1", name: "channel1", description: "channel for testing 1", _v: 0),
        Channel(id: "2", name: "channel2", description: "channel for testing 2", _v: 0)
    ]
    
    var message: [Message] = [
        Message(id: "1", messageBody: "message 1 for cannel 1", userId: "1", channelId: "1", userName: "Olga", userAvatar: "dark1", userAvatarColor: "[0.6666666666666666, 0.25098039215686274, 0.788235294117647, 1]", _v: 0, timeStamp: "2019-11-21T16:54:55.895Z"),
        Message(id: "2", messageBody: "message 2 for channel 1", userId: "2", channelId: "1", userName: "Olga2", userAvatar: "dark2", userAvatarColor: "[0.3176470588235294, 0.2235294117647059, 0.5725490196078431, 1]", _v: 0, timeStamp: "2019-11-21T17:02:06.422Z"),
    ]
    
    var addChannelResponce: String = "Channel saved successfully"
    
    private init(){}
}


struct Channel {
var id: String
var name: String
var description: String
var _v: Int
}

struct Account {
    var token: String
    var user: String
}

struct Message {
    
    var id: String
    var messageBody: String
    var userId: String
    var channelId: String
    var userName: String
    var userAvatar: String
    var userAvatarColor: String
    var _v: Int
    var timeStamp: String
}

struct User {
    var id: String
    var avatarColor: String
    var avatarName: String
    var email: String
    var name: String
    var _v: Int
}


