//
//  Game.swift
//  SupplyChainGame
//
//  Created by Adam Jozic on 14.12.2021..
//  Copyright © 2021 Filip Gadzo (RIT Student). All rights reserved.
//

import Foundation
import FirebaseFirestoreSwift
import SwiftUI

struct Game: Codable, Identifiable {
    
    @DocumentID var id: String?
    var turnId: Int
    var playerRole: String
    var inOrder: Int
    var outOrder: Int
    var store: Int
    var backlog: Int
    
    enum CodingKeys: String, CodingKey {
        case turnId
        case playerRole
        case inOrder
        case outOrder
        case store
        case backlog
    }
}
