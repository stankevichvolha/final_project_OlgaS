//
//  ChannelVC.swift
//  Smack(10)
//
//  Created by Volha  Stankevich on 11/13/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    
    //Outlets
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      self.revealViewController().rearViewRevealWidth = self.view.frame.size.width-60

    }
    

 

}
