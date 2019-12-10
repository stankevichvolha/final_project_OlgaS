//
//  SmackRouter.swift
//  Smack(10)UITests
//
//  Created by Volha  Stankevich on 12/4/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import Embassy
import EnvoyAmbassador
import Foundation


class SmackRouter: Router {
    
    private enum Endpoint {
        static let register = "account/register"
        static let login = "account/login"
        static let addUser = "user/add"
        static let addChannel = "channel/add"
        static let channel = "channel"
        static let findUserByEmail = "user/byEmail/olga@test.com"
        static let findAllMessages = "message/byChannel/1"
    }
    
    let session: Session = .shared
    
    override init() {
        super.init()
        setupLogin()
        setupFindUserByEmail()
        setupMessages()
        setupChannels()
    }
    
    private func setupLogin() {
        self[Endpoint.login] = JSONResponse { _ -> Any in
            return [
                "token": self.session.account[0].token,
                "user": self.session.account[0].user
                ]
        }
    }
    private func setupFindUserByEmail(){
        self[Endpoint.findUserByEmail] = JSONResponse {_ -> Any in
            return[
                "_id": self.session.user[0].id,
                "avatarColor": self.session.user[0].avatarColor,
                "avatarName": self.session.user[0].avatarName,
                "email": self.session.user[0].email,
                "name": self.session.user[0].name,
                "__v": self.session.user[0]._v
            ]
            
        }
    }
    
    private func setupMessages(){
        self[Endpoint.findAllMessages] = JSONResponse {_-> Any in
            return[
                [
                    "_id": self.session.message[0].id,
                    "messageBody": self.session.message[0].messageBody,
                    "userId": self.session.message[0].userId,
                    "channelId": self.session.message[0].channelId,
                    "userName": self.session.message[0].userName,
                    "userAvatar": self.session.message[0].userAvatar,
                    "userAvatarColor": self.session.message[0].userAvatarColor,
                    "__v": self.session.message[0]._v,
                    "timeStamp": self.session.message[0].timeStamp
                ],
                [
                    "_id": self.session.message[1].id,
                    "messageBody": self.session.message[1].messageBody,
                    "userId": self.session.message[1].userId,
                    "channelId": self.session.message[1].channelId,
                    "userName": self.session.message[1].userName,
                    "userAvatar": self.session.message[1].userAvatar,
                    "userAvatarColor": self.session.message[1].userAvatarColor,
                    "__v": self.session.message[1]._v,
                    "timeStamp": self.session.message[1].timeStamp
                ]
            ]
        }
        
    }
    
    private func setupChannels(){
        self[Endpoint.channel] = JSONResponse {_-> Any in
            return [
                [
                    "_id": self.session.channel[0].id,
                    "name": self.session.channel[0].name,
                    "description": self.session.channel[0].description,
                    "__v": self.session.channel[0]._v
                ]
            ]
        }
    }
    
    private func setupAddChannel(){
        self[Endpoint.addChannel] = JSONResponse {_-> Any in
            return [
                "message": self.session.addChannelResponce
            ]
        }
    }
    
}
