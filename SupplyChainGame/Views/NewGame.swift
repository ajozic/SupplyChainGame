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
            VStack {
                Image("newgame").resizable().frame(width: 100, height: 100).padding(.top, 130)
                Spacer()
                ZStack{
                    Rectangle().fill(Color.gray).frame(width: 300, height: 100).cornerRadius(20)
                    HStack{
                        NavigationLink (destination:
                                            PlayerView(player: Player( name: "player1", initialCount: 10, role: "Retailer"))){
                            Text("Retailer").padding(40)
                        }
                            .edgesIgnoringSafeArea([.top, .bottom])
                            .foregroundColor(.white)
    //                      .disabled(retailerTaken == true)
                        Image("retailer").resizable().frame(width: 30, height: 30).padding().background(Color.white).cornerRadius(50)
                    }
                }.padding()
                // end ZStack
                ZStack{
                    Rectangle().fill(Color.gray).frame(width: 300, height: 100).cornerRadius(20)
                    HStack{
                        NavigationLink (destination:
                                            PlayerView(player: Player(name:"player2",initialCount:10,role:"Wholesaler"))){
                            Text("Wholesaler").padding(30)
                        }
                            .edgesIgnoringSafeArea([.top, .bottom])
                            .foregroundColor(.white)
                        Image("wholesaler").resizable().frame(width: 30, height: 30).padding().background(Color.white).cornerRadius(50)
                    }
                }.padding()
                // end ZStack
                ZStack{
                    Rectangle().fill(Color.gray).frame(width: 300, height: 100).cornerRadius(20)
                    HStack{
                        NavigationLink (destination:
                                            PlayerView(player: Player(name:"player3",initialCount:10,role:"Distributor"))){
                            Text("Distributor").padding(35)
                        }
                            .edgesIgnoringSafeArea([.top, .bottom])
                            .foregroundColor(.white)
                        Image("distributor").resizable().frame(width: 30, height: 30).padding().background(Color.white).cornerRadius(50)
                    }
                }.padding()
                // end ZStack
                ZStack{
                    Rectangle().fill(Color.gray).frame(width: 300, height: 100).cornerRadius(20)
                    HStack{
                        NavigationLink (destination:
                                            PlayerView(player: Player(name:"player4",initialCount:10,role:"Manufacturer"))){
                            Text("Manufacturer").padding(30)
                        }
                            .edgesIgnoringSafeArea([.top, .bottom])
                            .foregroundColor(.white)
                        Image("manufacturer").resizable().frame(width: 30, height: 30).padding().background(Color.white).cornerRadius(50)
                    }
                }.padding()
                // end ZStack
            }//end VStack
            .padding()
            .navigationTitle(Text("Create a new game"))
            .navigationBarItems(trailing: NavigationLink(destination: Instructions()) {
                Text("How to Play")
            })
        }// end body
    }//end struct
    

