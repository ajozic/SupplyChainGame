

import SwiftUI

struct PlayerView: View {
    
    var player: Player
//    var game: Game
    
    @ObservedObject var controller = GameController()
    @ObservedObject private var viewModel = PlayerViewModel()
    
    @State var incomingOrder : String = ""
    @State var manufactureQuantity : String = ""
    @State var step1: String = ""
    @State var step2: String = ""
    
    @State private var initialCount: Int = 0
    
    //@State var steps: [String]
    @State var inventory : Int = 0
    @State var backlog : Int = 0
    //@State var orderStore : Int = 0
    @State var turnCount : Int = 1
    @State var shippingOrder: Int = Int.random(in: 1..<11)
    
    @State var turnDone : Bool = false
    
    // number formatter for input
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    //value: $initialCount, formatter: formatter
    
    var body: some View {
        
        VStack(alignment: .center){
            Text("Name: \(player.name)")
            Text("\(player.role)")
                .font(.system(size: 30))
                .bold()
                .padding(5)
            Text("Turn: \(turnCount)")
                .font(.system(size: 30))
                .bold()
                .padding(5)
            
            HStack(){
                VStack(){
                    Image(systemName: "tray.2.fill").foregroundColor(.white).imageScale(.medium)
                    
                    Text("Inventory: \(inventory)").padding()
                }
                VStack(){
                    Image(systemName: "clock.fill").foregroundColor(.white).imageScale(.medium)
                    Text("Backlog: \(backlog)").padding()
//                    Button(action: {
//                        viewModel.getMyInOrder(role: player.role)
//                    }) {
//                        HStack {
//                            Image(systemName: "plus")
//                                .font(.title)
//                        }
//                        .padding()
//                        .foregroundColor(.white)
//                        .background(Color.blue)
//                        .cornerRadius(40)
//                    }
                }//  end Vstack
                
            }
            .frame(width: 400, height: 150, alignment: .center)
            .background(Color.blue)
            .padding()
            
            
            Text("Incoming order")
                .bold()
            Text(incomingOrder)
                .padding(10)
            
            switch player.role {
            case "Manufacturer":
                Text("Manufacturer quantity").bold()
            case "Wholesaler":
                Text("Wholesaler quantity").bold()
            case "Distributor":
                Text("Distributor quantity").bold()
            case "Retailer":
                Text("Retailer quantity").bold()
            default:
                Text("Order quantity").bold()
            }
            
            //            if(player.role == "Manufacturer"){
            //                Text("Manufacture quantity").bold()
            //            }else{
            //                Text("Order quantity")
            //                .bold()}
            
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
                //print("turn ended")
                turnDone.toggle()
                self.turnCount = controller.endTurn()
                //self.orderStore = orderStore + (Int(manufactureQuantity) ?? 0)
                
                self.inventory = self.inventory - controller.getOrder(inventory:inventory, shippingOrder:shippingOrder)
                
                self.step1 = String(controller.getOrder(inventory:inventory, shippingOrder:shippingOrder))
                
                self.inventory = self.inventory + controller.sendOrder(order : Int(manufactureQuantity) ?? 0, inventory : inventory)
                print("Player Inventory is \(self.inventory)")
                //self.inventory = inventory + orderStore
                self.manufactureQuantity = ""
                //sleep(10)
                turnDone.toggle()
                
                let int = Int(incomingOrder) ?? 0
                let int1 = Int(manufactureQuantity) ?? 0
                
                viewModel.addData(game: Game(id: String(turnCount), turnId: turnCount, playerRole: player.role, inOrder: int, outOrder: int1, store: inventory, backlog: backlog))
                
                //self.step1 = self.manufactureQuantity
                
                //                if(self.step2 == "" && self.step1 != ""){
                //                    self.step2 = self.step1
                //                }else if(self.step2 == "" && self.step1 == ""){
                //                    self.step1 = self.manufactureQuantity
                //                }
            }) {
                if(player.role == "Manufacturer"){
                    Text("Manufacture")}else{
                        Text("Order")}
            }.disabled(turnDone == true)
            
            HStack(){
                VStack(){
                    Text("Step 1").bold().padding(10)
                    Text(step1)
                    ZStack{
                        Rectangle().fill(Color.white).frame(width: 50, height: 50).border(Color.black)
                        Image("intransit").resizable().frame(width: 25, height: 25)
                    }
                }
                VStack(){
                    Text("Step 2").bold().padding(10)
                    Text(step2)
                    ZStack{
                        Rectangle().fill(Color.white).frame(width: 50, height: 50).border(Color.black)
                    }
                }
                
                NavigationLink ("Chat", destination: Chat(player: player))
                
            }.padding(15)
                .onAppear() {
                    viewModel.getMyInOrder(role: player.role)
                }
            //Spacer()
            
        }.navigationBarItems(trailing: NavigationLink(destination: Instructions()) {
            Text("How to Play")
        })
    }
}
