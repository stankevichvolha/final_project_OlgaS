//
//  AvatarPickerScreen.swift
//  Smack(10)UITests
//
//  Created by Volha  Stankevich on 12/2/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import XCTest

class AvatarPickerScreen: BaseScreen {
    
    private let avatar = app.collectionViews.cells.element(boundBy: Int.random(in: 0...27))
    
    func pickAvatar() {
        tap(avatar)
    }
}
