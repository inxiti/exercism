import Foundation

enum Sublist { case equal, sublist, superlist, unequal }

func classifier(listOne l1: [Int], listTwo l2: [Int]) -> Sublist {
    let s1 = String(describing: l1).dropFirst().dropLast()
    let s2 = String(describing: l2).dropFirst().dropLast()
    
    if l1 == l2 { return .equal }
    if s1.contains(s2) || s2.isEmpty { return .superlist }
    if s2.contains(s1) || s1.isEmpty { return .sublist }
    
    return .unequal
}
