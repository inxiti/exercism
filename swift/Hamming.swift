class Hamming {
    class func compute(_ a: String, against b: String) -> Int? {
        guard a.count == b.count else { return nil }

        return a.enumerated().flatMap {
            return b[b.index(b.startIndex, offsetBy: $0)] != $1 ? 1 : nil
        }.count
        
//        return zip(a, b).filter { $0 != $1 }.count
    }
}
