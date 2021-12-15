//
//  Queue.swift
//  SupplyChainGame
//
//  Created by Petar Gojun on 14.12.2021..
//  Copyright © 2021 Filip Gadzo (RIT Student). All rights reserved.
//

//import Foundation

struct Queue<T>{
  public var elements: [T] = []


  mutating func enqueue(_ value: T) {
    elements.append(value)
  }

  mutating func dequeue() -> T? {
    guard !elements.isEmpty else {
      return nil
    }
    return elements.removeFirst()
  }

  var head: T? {
    return elements.first
  }

  var tail: T? {
    return elements.last
  }
}

//struct Queue<T>: CustomStringConvertible {
//
//private var elements: [T] = []
//public init() {}
//var isEmpty: Bool {
//elements.isEmpty
//}
//var peek: T? {
//elements.first
//}
//var description: String {
//if isEmpty { return "Queue is empty ... " }
//return "- Queue start ----\n"
//+ elements.map({ "\($0)"}).joined(separator: " -> ")
//+ "\n---- Queue End ---- "
//}
//mutating func enqueue(_ value: T) {
//elements.append(value)
//}
//mutating func dequeue() -> T? {
//isEmpty ? nil : elements.removeFirst()
//}
//}

//struct Queue{
//
//    var items:[Int] = []
//
//    mutating func enqueue(element: Int)
//    {
//        items.append(element)
//    }
//
//    mutating func dequeue() -> Int?
//    {
//
//        if items.isEmpty {
//            return nil
//        }
//        else{
//            let tempElement = items.first
//            items.remove(at: 0)
//            return tempElement
//        }
//    }
//
//}

