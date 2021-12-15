//
//  ChatViewModel.swift
//  SupplyChainGame
//
//  Created by Adam Jozic on 15.12.2021..
//  Copyright © 2021 Filip Gadzo (RIT Student). All rights reserved.
//

import Foundation
import FirebaseFirestore

class ChatViewModel: ObservableObject {
    
    @Published var chats = [Message]()
    
    private var db = Firestore.firestore()
 
    func addData(message: Message) {
        do {
            let _ = try db.collection("messages").addDocument(from: message)
        }
        catch {
            print(error)
        }
    }// end add data
    
    
}
