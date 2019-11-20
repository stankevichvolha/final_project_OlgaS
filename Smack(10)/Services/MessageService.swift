//
//  MessageService.swift
//  Smack(10)
//
//  Created by Volha  Stankevich on 11/19/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    static let instance = MessageService()
    
    var channels = [Channel]()
    var selectedChannel:Channel?
    
    func findAllChannel(completion: @escaping CopletionHandler){
            Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
                if response.result.error == nil {
                    guard let data = response.data else {return}
                    if let json = try!JSON(data:data).array {
                        for item in json{
                            let name = item["name"].stringValue
                            let channelDescription = item["description"].stringValue
                            let id = item["_id"].stringValue
                            let channel = Channel(channelTitle: name, channelDescription: channelDescription, id: id)
                            self.channels.append(channel)
                        }
                        NotificationCenter.default.post(name: NOTIF_UCHANNELS_LOADED, object: nil)
                        completion(true)
                    }
                    
                } else {
                    completion(false)
                    debugPrint(response.result.error as Any)
            }
        }
    }
    func clearChannels(){
        channels.removeAll()
    }
    
}
