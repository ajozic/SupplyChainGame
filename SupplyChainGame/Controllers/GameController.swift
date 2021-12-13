
import Foundation

class GameController: Codable, ObservableObject{
    
    init(){
        
    }
    
  //  var player : Player
    var order : Int = 2
    var count : Int = 10
    public var turnCount : Int = 0
    var manufacturerEnded : Bool = true
    var wholesalerEnded: Bool = true
    var supplierEnded : Bool = true
    var retailerEnded : Bool = true
    
    func getOrder(order:Int){
        count = self.count - order
    }
    
    func sendOrder(order:Int){
        if(turnCount % 2 == 0){
            count = self.count + order
        }
    }
    
    func endTurn(){
        if(manufacturerEnded == true && wholesalerEnded == true && supplierEnded == true && retailerEnded == true){
            turnCount+=1
            print("Turn \(turnCount) ended")
            
//            sleep(10)
//
            manufacturerEnded = false
            wholesalerEnded = false
            supplierEnded = false
            retailerEnded = false
        }
    }
    
}
