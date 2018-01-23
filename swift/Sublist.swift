import Foundation

enum Sublist { case equal, sublist, superlist, unequal }

func classifier(listOne l1: [Int], listTwo l2: [Int]) -> Sublist {
    if l1 == l2 { return .equal }
    if l1.isEmpty && !l2.isEmpty { return .sublist }
    if !l1.isEmpty && l2.isEmpty { return .superlist }
    
    let s1 = String(describing: l1).dropFirst().dropLast()
    let s2 = String(describing: l2).dropFirst().dropLast()
    
    if s1.contains(s2) { return .superlist }
    if s2.contains(s1) { return .sublist }
    
    return .unequal
}
