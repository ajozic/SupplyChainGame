//
//  UserAuth.swift
//  SupplyChainGame
//
//  Created by Adam Jozic on 02.12.2021..
//  Copyright © 2021 Filip Gadzo (RIT Student). All rights reserved.
//


import Combine
import Firebase

class UserAuth: ObservableObject {

  let didChange = PassthroughSubject<UserAuth,Never>()

  // required to conform to protocol 'ObservableObject'
  let willChange = PassthroughSubject<UserAuth,Never>()
  @Published var isLoggedin = false

//  func login() {
//    // login request... on success:
//    self.isLoggedin = true
//  }
//
    func login(email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, error)  in
            
            if error != nil {
                self.isLoggedin = false
                    print("Login failed")
                print(email)
                print(password)
            }
            else {
                self.isLoggedin = true
                print("login successsscscsccs1!")
                print(self.isLoggedin)
                
            }
        }// end auth
        
    }// end login

//    @Published var isLoggedin = false {
//    didSet {
//      didChange.send(self)
//    }

    // willSet {
    //       willChange.send(self)
    // }
  }

