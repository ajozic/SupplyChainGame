//
//  Message.swift.swift
//  SupplyChainGame
//
//  Created by Adam Jozic on 15.12.2021..
//  Copyright © 2021 Filip Gadzo (RIT Student). All rights reserved.
//

import Foundation
import SwiftUI
import FirebaseFirestoreSwift

struct Message: Codable {
    var author : String
    var message : String
    
    enum CodingKeys: String, CodingKey {
        case author
        case message
    }
}
