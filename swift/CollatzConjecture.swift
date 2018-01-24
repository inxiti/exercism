enum NumberError: Error { case invalid }

class CollatzConjecture {
    class func steps(_ n: Int) throws -> Int {
        guard n > 0 else { throw NumberError.invalid }
        
        var counts: [Int] = [1]
        
        func collatzSequenceCount(of n: Int) -> Int {
            guard counts.count < n else { return counts[n - 1] }

            return 1 + collatzSequenceCount(of: n % 2 == 0 ? n / 2 : 3 * n + 1)
        }
        
        return collatzSequenceCount(of: n) - 1
    }
}
