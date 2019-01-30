//
//  Feed.swift
//  SpaRez
//
//  Created by apple on 7/12/18.
//  Copyright © 2018 merakeb. All rights reserved.
//

import Foundation

class Feed {
    var content: String
    var senderId: String
    
    init( content: String, senderId: String) {
        self.content = content
        self.senderId = senderId
    }
}
