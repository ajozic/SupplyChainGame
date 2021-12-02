//
//  ContentView.swift
//  SupplyChainGame
//
//  Created by Filip Gadzo (RIT Student) on 11/24/21.
//  Copyright © 2021 Filip Gadzo (RIT Student). All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userAuth = UserAuth()
    
    
    var body: some View {
        VStack{
                    if userAuth.isLoggedin == false  {
                        LoginView()
                            
                        } else if userAuth.isLoggedin == true {
                        Dashboard()
                            
                    }

                
            
        }// end VStack
    }// end body
    

}// end struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
