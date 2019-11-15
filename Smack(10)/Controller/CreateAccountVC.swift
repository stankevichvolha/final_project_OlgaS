//
//  CreateAccountVC.swift
//  Smack(10)
//
//  Created by Volha  Stankevich on 11/14/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
}
