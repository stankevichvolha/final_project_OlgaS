//
//  ChannelCell.swift
//  Smack(10)
//
//  Created by Volha  Stankevich on 11/19/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {
    
    //Outlets
    
    @IBOutlet weak var channalName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.setSelected(selected, animated: animated)
        if selected{
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        } else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
        
    }
    
    func configureCell(channel: Channel) {
        let title = channel.channelTitle ?? ""
        channalName.text = "#\(title)"
    }

}
