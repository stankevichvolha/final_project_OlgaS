//
//  LoginVC.swift
//  Smack(10)
//
//  Created by Volha  Stankevich on 11/14/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccauntBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCAUNT, sender: nil)
    }
}
