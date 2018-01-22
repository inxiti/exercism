enum BinarySearchError: Error {
    case unsorted
}

class BinarySearch {
    let list: [Int]
    let middle: Int
    
    init(_ ns: [Int]) throws {
        guard ns == ns.sorted() else { throw BinarySearchError.unsorted }
        
        list = ns.sorted()
        middle = ns.count / 2
    }
    
    func searchFor(_ n: Int) -> Int? {
        var position = middle
        
        func find(_ l: [Int], middle i: Int) -> Int? {
            guard !l.isEmpty else { return nil }
            if l.count == 2 && l[1] == n { position += 1 }
            guard l[i] != n else { return n }
            
            let list = n < l[i] ? l[..<i] : l[(i + 1)...]
            let index = list.count / 2
            position = n < l[i] ? position - index - 1: position + index + 1
            
            return find(Array(list), middle: index)
        }
        
        return find(list, middle: middle) != nil ? position : nil
    }
}
