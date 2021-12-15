
import Foundation
import FirebaseFirestore

class GameController : ObservableObject, Codable{
    
    //private var db = Firestore.firestore()
    
    init(){
        
    }
    
  //  var player : Player
    var order : Int = 2
    var inventory : Int = 10
    public var turnCount : Int = 1
    var manufacturerEnded : Bool = true
    var wholesalerEnded: Bool = true
    var supplierEnded : Bool = true
    var retailerEnded : Bool = true
    //var orderQueue = Queue2<Int>()
    
    
    public var elements: [Int] = []


    func enqueue(_ value: Int) {
      elements.append(value)
    }

    func dequeue() -> Int? {
      guard !elements.isEmpty else {
        return nil
      }
      return elements.removeFirst()
    }

    
    func getOrder(inventory:Int,shippingOrder:Int)->(Int){
        
        var inv = inventory
        inv = inv - shippingOrder
        return inv
    }
    
    func sendOrder(order:Int, inventory: Int)->(Int){
        var nesto : Int = inventory
        if(turnCount % 2 != 0 && turnCount <= 3){
            enqueue(order)
            let deliveredOrder : Int = dequeue() ?? 0
            nesto = nesto + deliveredOrder

           // print("Inventory is \(nesto)")

        }else if(turnCount % 2 == 0 && turnCount <= 3){
            enqueue(order)
            print("Order is \(order)")
        }else if(turnCount > 3){
            enqueue(order)
            let deliveredOrder : Int = dequeue() ?? 0
            nesto = nesto + deliveredOrder
        }
        return nesto
    }
    
    func endTurn()->(Int){
        if(manufacturerEnded == true && wholesalerEnded == true && supplierEnded == true && retailerEnded == true){
            print("Turn \(turnCount) ended")
            turnCount+=1
            
            
            sleep(5)

//            manufacturerEnded = false
//            wholesalerEnded = false
//            supplierEnded = false
//            retailerEnded = false
        }
        return turnCount
    }
    
}

