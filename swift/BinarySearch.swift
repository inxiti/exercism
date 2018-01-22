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
        func findWithin(_ s: Int, _ e: Int) -> Int? {
            let position = s + (e - s) / 2
            
            guard position != 0 else { return nil }

            if list[position] == n { return position }
            if list[position] <  n { return findWithin(position + 1, e) }
            else { return findWithin(s, position) }
        }
        
        return findWithin(0, list.count)
    }
}
