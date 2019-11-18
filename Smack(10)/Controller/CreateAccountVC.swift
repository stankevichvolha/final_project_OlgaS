//
//  CreateAccountVC.swift
//  Smack(10)
//
//  Created by Volha  Stankevich on 11/14/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    //Outlets
    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    //variables
    var avatarName1 = "profileDefault"
    var avatarColor = "[0.5,0.5,0.5,1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        print("\(UserDataService.instance.avatarName)Hello")
        if UserDataService.instance.avatarName != "" {
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName1 = UserDataService.instance.avatarName
        }
    }
    
    @IBAction func createAccntPressed(_ sender: Any) {
        guard let email = emailTxt.text, emailTxt.text != "" else {return}
        guard let pass = passTxt.text, passTxt.text != "" else {return}
        guard let name = usernameTxt.text, usernameTxt.text != "" else {return}
        
        AuthService.instance.registerUsert(email: email, password: pass) { (success) in
            if success{
                AuthService.instance.loginUser(email: email, password: pass) { (succsess) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName1, avatarColor: self.avatarColor) { (seccess) in
                            if success {
                                print (UserDataService.instance.name, UserDataService.instance.avatarName)
                            self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {

    performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)

    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
    }
    

    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    
}
