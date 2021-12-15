//
//  PlayerViewModel.swift
//  SupplyChainGame
//
//  Created by Adam Jozic on 13.12.2021..
//  Copyright © 2021 Filip Gadzo (RIT Student). All rights reserved.
//

import Foundation
import FirebaseFirestore

class PlayerViewModel: ObservableObject {
    
    @Published var games = [Game]()
    
    private var db = Firestore.firestore()
    
    //  func getOutOrderFromOutside/
    
    func fetchData(playerRole: String) {
        db.collection("game").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.games = documents.map { (queryDocumentSnapshot) -> Game in
                let data = queryDocumentSnapshot.data()
                let turnId = data["turnId"] as? Int ?? 0
                let playerRole = data["playerRole"] as? String ?? ""
                let inOrder = data["inOrder"] as? Int ?? 0
                let outOrder = data["outOrder"] as? Int ?? 0
                let store = data["store"] as? Int ?? 0
                let backlog = data["backlog"] as? Int ?? 0
                
                return Game(turnId: turnId, playerRole: playerRole, inOrder: inOrder, outOrder: outOrder, store: store, backlog: backlog)
            }
            print("Returning player with role:", playerRole)
            
        }
    }// end fetch data
    
    func getMyInOrder(role: String) {
        db.collection("game").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.games = documents.map { (queryDocumentSnapshot) -> Game in
                let data = queryDocumentSnapshot.data()
                let turnId = data["turnId"] as? Int ?? 0
                let playerRole = data["playerRole"] as? String ?? ""
                let inOrder = data["inOrder"] as? Int ?? 0
                let outOrder = data["outOrder"] as? Int ?? 0
                let store = data["store"] as? Int ?? 0
                let backlog = data["backlog"] as? Int ?? 0
                
                //print("blaaaaaaaaaaaaaaaa")
                
                if(role == "Manufacturer" && playerRole == "Distributor" ) {
                    print("Vracam incoming order od Distributor")
                    //print(data) zanima me incoming order
                    print(outOrder)
                    return Game(turnId: turnId, playerRole: playerRole, inOrder: inOrder, outOrder: outOrder, store: store, backlog: backlog)
                    
                } else if (role == "Distributor" && playerRole == "Manufacturer") {
                    print(outOrder)
                    print("Vracam outgoing order od Transporta")
                    return Game(turnId: turnId, playerRole: playerRole, inOrder: inOrder, outOrder: outOrder, store: store, backlog: backlog)
                    //zanima me outgoing order
                
                } else if (role == "Distributor" && playerRole == "Wholesaler") {
                    print(outOrder)
                    return Game(turnId: turnId, playerRole: playerRole, inOrder: inOrder, outOrder: outOrder, store: store, backlog: backlog)
                } else if (role == "Wholesaler" && playerRole == "Distributor") {
                    print(outOrder)
                    return Game(turnId: turnId, playerRole: playerRole, inOrder: inOrder, outOrder: outOrder, store: store, backlog: backlog)
                
                } else if (role == "Wholesaler" && playerRole == "Retailer") {
                    print(outOrder)
                    return Game(turnId: turnId, playerRole: playerRole, inOrder: inOrder, outOrder: outOrder, store: store, backlog: backlog)
                
                } else if (role == "Retailer" && playerRole == "Wholesaler") {
                    print(outOrder)
                    return Game(turnId: turnId, playerRole: playerRole, inOrder: inOrder, outOrder: outOrder, store: store, backlog: backlog)
                }
                print("ae")
                return Game(turnId: turnId, playerRole: "ovo mi odjebi", inOrder: inOrder, outOrder: outOrder, store: store, backlog: backlog)
            }// end map
        }// end snapshot listener
    }// end func
    
    func addData(game: Game) {
        do {
            let _ = try db.collection("game").addDocument(from: game)
        }
        catch {
            print(error)
        }
    }// end add data
    
    
    
    func updatePlayer(initialcount: Int, documentId: String, completion: @escaping (Bool) -> ()) {
        
        db.collection("player").document("UkrZ6JOxeg9o0bPWzbHo").updateData(["initialCount": initialcount]) {
            (err) in
            
            if err != nil {
                completion(false)
                return
                
            }
            completion(true)
        }
    }//  end update player
    
    //    private func removeData(_ player: Player) {
    //       if let documentId = player.id {
    //         db.collection("players").document(documentId).delete { error in
    //           if let error = error {
    //             print(error.localizedDescription)
    //           }
    //         }
    //       }
    //     }
    
    
}


