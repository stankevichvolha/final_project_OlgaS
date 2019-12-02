//
//  AddChannelVC.swift
//  Smack(10)
//
//  Created by Volha  Stankevich on 11/19/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    //Outlets
    
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var chanDesc: UITextField!
    @IBOutlet weak var createChannelBtn: RoundedButton!
    @IBOutlet weak var bgView: UIView!
    
    func setAccessibility() {
        nameTxt.isAccessibilityElement = true
        nameTxt.accessibilityIdentifier = "nameTxtAddChannelVC"
        chanDesc.isAccessibilityElement = true
        chanDesc.accessibilityIdentifier = "chanDescAddChannelVC"
        createChannelBtn.isAccessibilityElement = true
        createChannelBtn.accessibilityIdentifier = "createChannelBtnAddChannelVC"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAccessibility()
        setupView()

    }

    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func createChannelPressed(_ sender: Any) {
        guard let channelName = nameTxt.text, nameTxt.text != "" else {return}
        guard let channelDesc = chanDesc.text else {return}
        SocketService.instance.addChannel(channelName: channelName, channelDeskription: channelDesc) { (success) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func setupView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
        nameTxt.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedString.Key.foregroundColor : smackPurplePlaceholder])
        chanDesc.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedString.Key.foregroundColor : smackPurplePlaceholder])

        }
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
}
