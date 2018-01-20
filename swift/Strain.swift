extension Array {
    func keep(_ f: (Element) -> Bool) -> Array {
        var tmpArray = [Element]()
        
        for e in self { if f(e) { tmpArray.append(e) } }
        
        return tmpArray
    }
    
    func discard(_ f: (Element) -> Bool) -> Array {
        return keep { !f($0) }
    }
}
