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
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: NewGame()
                            //.navigationBarTitle(Text("Home"))
                            .edgesIgnoringSafeArea([.top, .bottom])) {
                Text("Create New Game")
            }
                .padding()
                .navigationBarTitle("Dashboard")
                .navigationBarItems(trailing: NavigationLink(destination: Instructions()) {
                    Text("How to Play")
                    
        })
    }// end Dashboard Body
}// end Dashboard View

//
//                                    isInstructions = true
//                                }.sheet(isPresented: $isInstructions, content: {
//                                    Instructions()
//                                })

}
