
import Foundation

struct Player:Codable, Identifiable{
    
    var id: String = UUID().uuidString
    var name: String
    var initialCount: Int
    var role: String
    
}
