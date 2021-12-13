//
//  Instructions.swift
//  SupplyChainGame
//
//  Created by Filip Gadzo (RIT Student) on 11/24/21.
//  Copyright © 2021 Filip Gadzo (RIT Student). All rights reserved.
//

import Foundation
import SwiftUI


struct NewGame: View {
    
    
    var retailerTaken : Bool = true
    var wholesalerTaken : Bool = false
    var distributorTaken : Bool = false
    var manufacturerTaken: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                ZStack{
                    Rectangle().fill(Color.gray).frame(width: 300, height: 100).cornerRadius(20)
                    NavigationLink ("Retailer", destination:
                                        PlayerView(player: Player(id:0, name: "player1", initialCount: 10, role: "Retailer")))
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                    //.navigationBarTitle(Text("Home"))
                        .edgesIgnoringSafeArea([.top, .bottom])
                        .foregroundColor(.white)
                        .disabled(retailerTaken == true)
                    
                }.padding()
                ZStack{
                    Rectangle().fill(Color.gray).frame(width: 300, height: 100).cornerRadius(20)
                    NavigationLink ("Wholesaler", destination:
                                        PlayerView(player: Player(id:1,name:"player2",initialCount:10,role:"Wholesaler")))
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                    //.navigationBarTitle(Text("Home"))
                        .edgesIgnoringSafeArea([.top, .bottom])
                        .foregroundColor(.white)
                }.padding()
                ZStack{
                    Rectangle().fill(Color.gray).frame(width: 300, height: 100).cornerRadius(20)
                    NavigationLink ("Distributor", destination:
                                        PlayerView(player: Player(id:1,name:"player3",initialCount:10,role:"Distributor")))
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                    //.navigationBarTitle(Text("Home"))
                        .edgesIgnoringSafeArea([.top, .bottom])
                        .foregroundColor(.white)
                }.padding()
                ZStack{
                    Rectangle().fill(Color.gray).frame(width: 300, height: 100).cornerRadius(20)
                    NavigationLink ("Manufacturer", destination:
                                        PlayerView(player: Player(id:1,name:"player4",initialCount:10,role:"Manufacturer")))
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                    //.navigationBarTitle(Text("Home"))
                        .edgesIgnoringSafeArea([.top, .bottom])
                        .foregroundColor(.white)
                }.padding()
                
                
                // end ZStack
            }.padding()
                .navigationBarTitle("Create New Game")
            
        }
        
    }// end body
}
