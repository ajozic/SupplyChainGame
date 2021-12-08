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
    var body: some View {
        
        NavigationView {
            
            VStack {
                ZStack{
                    Rectangle().fill(Color.gray).frame(width: 300, height: 100).cornerRadius(20)
                    Text("Retailer").foregroundColor(.white)
                }.padding()
                ZStack{
                    Rectangle().fill(Color.gray).frame(width: 300, height: 100).cornerRadius(20)
                    Text("Wholesaler").foregroundColor(.white)
                }.padding()
                ZStack{
                    Rectangle().fill(Color.gray).frame(width: 300, height: 100).cornerRadius(20)
                    Text("Distributor").foregroundColor(.white)
                }.padding()
                ZStack{
                    Rectangle().fill(Color.gray).frame(width: 300, height: 100).cornerRadius(20)
                    NavigationLink ("Manufacturer", destination: Manufacturer().navigationBarBackButtonHidden(true).navigationBarHidden(true)
                                        //.navigationBarTitle(Text("Home"))
                                        .edgesIgnoringSafeArea([.top, .bottom])).foregroundColor(.white)
                }.padding()
                

            // end ZStack
            }.padding()
            .navigationBarTitle("Create New Game")
            
        }

    }// end body
}