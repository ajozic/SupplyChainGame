//
//  Dashboard.swift
//  SupplyChainGame
//
//  Created by Adam Jozic on 24.11.2021..
//  Copyright © 2021 Filip Gadzo (RIT Student). All rights reserved.
//

import Foundation
import SwiftUI

struct Dashboard: View {
    @State var isInstructions: Bool = false
    @State var didTap: Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                Image("beer").resizable().frame(width: 200, height: 200).padding(.bottom, 100).padding(.top, 50)
                
                NavigationLink(destination: NewGame()
                                //.navigationBarTitle(Text("Home"))
                                .edgesIgnoringSafeArea([.top, .bottom])) {
                    Text("Create New Game")
                }// end of navigation
                        .padding(20)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 60)
                    .navigationTitle(Text("Dashboard"))
                    .background(Color.blue)
                    .cornerRadius(16)
                    .navigationBarItems(trailing: NavigationLink(destination: Instructions()) {
                    Text("How to Play")
                    })
                Spacer()
            }
        }// end Dashboard Body
    }
}// end Dashboard View

//
//                                    isInstructions = true
//                                }.sheet(isPresented: $isInstructions, content: {
//                                    Instructions()
//                                })

