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

//segue

let TO_LOGIN = "toLogin"
let TO_CREATE_ACCAUNT = "toCreateAccaunt"
let UNWIND = "unwindToChennel"

//user defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//headers

let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]
