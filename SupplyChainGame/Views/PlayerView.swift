

import SwiftUI

struct PlayerView: View {
    
    // var player = Player(id:1,name: "player1",initialCount: 10,role:"Test")
    var player :Player
    
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
            Text("Name: \(player.name)")
            Text("\(player.role)")
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
            if(player.role == "Manufacturer"){
                Text("Manufacture quantity").bold()
            }else{
                Text("Order quantity")
                .bold()}
            if(player.role == "Manufacturer"){
                TextField("Manufacture qty",text: $manufactureQuantity)
                    .multilineTextAlignment(.center)
                    .keyboardType(.decimalPad)
            }else{
                TextField("Order qty",text: $manufactureQuantity)
                    .multilineTextAlignment(.center)
                .keyboardType(.decimalPad)}
            
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
                if(player.role == "Manufacturer"){
                    Text("Manufacture")}else{
                        Text("Order")}
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
            //Spacer()
            
        }
    }
}
