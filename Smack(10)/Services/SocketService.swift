//
//  SocketService.swift
//  Smack(10)
//
//  Created by Volha  Stankevich on 11/19/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {
    
    static let instance = SocketService()
    
    let manager: SocketManager
    let socket: SocketIOClient
    
    override init() {
        self.manager = SocketManager(socketURL: URL(string: BASE_URL)!)
        self.socket = manager.defaultSocket
        super.init()
    }

    func establishConection(){
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
    
    func addChannel(channelName: String, channelDeskription: String, completion: @escaping CopletionHandler){
        socket.emit("newChannel", channelName, channelDeskription)
        completion(true)
    }
    
    func getChannel (completion: @escaping CopletionHandler) {
        socket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else {return}
            guard let channelDesc = dataArray[1] as? String else {return}
            guard let channelId = dataArray[2] as? String else {return}
            
            let newChannel = Channel(channelTitle: channelName, channelDescription: channelDesc, id: channelId)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
}
