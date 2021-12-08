//
//  Manufacturer.swift
//  SupplyChainGame
//
//  Created by Adam Jozic on 08.12.2021..
//  Copyright © 2021 Filip Gadzo (RIT Student). All rights reserved.
//


import SwiftUI

struct Manufacturer: View {
    
@State var incomingOrder : String = ""
@State var manufactureQuantity : String = ""
@State var step1: String = ""
@State var step2: String = ""
    
//@State var steps: [String]
@State var inventory : Int = 0
@State var backlog : Int = 0

var body: some View {
    
    VStack(alignment: .center){
        Spacer()
        Text("Manufacturer")
            .font(.system(size: 30))
            .bold()
            .padding(5)

        HStack(){
            VStack(){
                Image(systemName: "square.fill")
                
                Text("Inventory: \(inventory)").padding()
            }
            VStack(){
                Image(systemName: "clock.fill")
                Text("Backlog: \(backlog)").padding()
            }
        }
        .frame(width: 400, height: 150, alignment: .center)
        .background(Color(.systemGray5))
        .cornerRadius(15)
        .padding()

        Text("Incoming order")
            .bold()
        TextField("Order qty",text: $incomingOrder)
            .disabled(true)
            .multilineTextAlignment(.center)
            .padding(10)
        Text("Manufacture quantity")
            .bold()
        TextField("Manufacture qty",text: $manufactureQuantity)
            .multilineTextAlignment(.center)
            .keyboardType(.decimalPad)
//            Button("Manufacture"){
//                self.manufactureQuantity = self.manufactureQuantity
//            }
        
        Button(action: {
                              self.step1 = self.manufactureQuantity

//                if(self.step2 == "" && self.step1 != ""){
//                    self.step2 = self.step1
//                }else if(self.step2 == "" && self.step1 == ""){
//                    self.step1 = self.manufactureQuantity
//                }
        }) {
            Text("Manufacture")
        }
        
        
        
        HStack(){
            VStack(){
                Text("Step 1").bold().padding(10)
                Text(step1)
            }
            VStack(){
                Text("Step 2").bold().padding(10)
                Text(step2)
            }
        }.padding(15)
        Spacer()
        
    }
}
}
