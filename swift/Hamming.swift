class Hamming {
    class func compute(_ a: String, against b: String) -> Int? {
        guard a.count == b.count else { return nil }

        return a.enumerated().flatMap {
            return b[b.index(b.startIndex, offsetBy: $0)] != $1 ? 1 : nil
        }.count
<<<<<<< HEAD
=======
        
//        return zip(a, b).filter { $0 != $1 }.count
>>>>>>> ab4defa80b4d78651a6e84f3cd4ca84e5a87fc57
    }
}
