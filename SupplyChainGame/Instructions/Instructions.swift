//
//  Instructions.swift
//  SupplyChainGame
//
//  Created by Filip Gadzo (RIT Student) on 11/24/21.
//  Copyright © 2021 Filip Gadzo (RIT Student). All rights reserved.
//

import Foundation
import SwiftUI


struct Instructions: View {
    @ObservedObject private var viewModel = PlayerViewModel()
    
    var body: some View {
        
//        List(viewModel.games) { game in
//                       VStack(alignment: .leading) {
////                           Text(game.turnId).font(.title)
//                           Text("\(game.inOrder)")
//                       }
//                   }.onAppear() {
//                      // self.viewModel.fetchData()
//                   }
        
            VStack{

                Text("This game simulates the supply and disribution chain of a company")
                
                Text("As one of the industrial stakeholders, your objective is to order the good quantity of beer packs each week").padding(5)
                
                Text("Make sure you keep a reasonable level of stock and no backlog order as they generate costs").padding(5)
                
                Spacer()
                Image("supplyChain").resizable().frame(width: 400, height: 300)
                Spacer()
            }.padding()

            .navigationBarTitle("How to Play")
    }
}
