class SumOfMultiples {
    class func toLimit(_ limit: Int, inMultiples ms: [Int]) -> Int {
        guard limit > 0 else { return 0 }
        
        return Set<Int>(ms.flatMap { m in
            (1..<limit).map { i in
                return m * i < limit ? m * i : 0
            }
        }).reduce(0, +)
    }
}
