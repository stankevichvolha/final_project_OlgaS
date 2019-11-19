//
//  Constants.swift
//  Smack(10)
//
//  Created by Volha  Stankevich on 11/14/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import Foundation

typealias CopletionHandler = (_ Success: Bool)->()

//url constants
let BASE_URL = "https://smackolgas.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let URL_GET_CHANNELS = "\(BASE_URL)channel"

//colors

let smackPurplePlaceholder = #colorLiteral(red: 0, green: 0.4664626122, blue: 1, alpha: 0.5)

//notifications constants
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")

//segue

let TO_LOGIN = "toLogin"
let TO_CREATE_ACCAUNT = "toCreateAccaunt"
let UNWIND = "unwindToChennel"
let TO_AVATAR_PICKER = "toAvatarPicker"

//user defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//headers

let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

let BEARER_HEADER = [
    "Authorization":"Bearer \(AuthService.instance.authToken)",
    "Content-Type": "application/json; charset=utf-8"
]
