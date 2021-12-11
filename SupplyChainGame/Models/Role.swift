
import Foundation

enum Role: Int, CustomStringConvertible, Codable {
    case manufacturer = 1
    case wholesaler = 2
    case supplier = 3
    case retailer = 4


    var description: String {
        switch self {
        case .manufacturer:
            return "Manufacturer"
        case .wholesaler:
            return "Wholesaler"
        case .supplier:
            return "Supplier"
        case .retailer:
            return "Retailer"
        default:
            return "Error"
        }
    }
}
