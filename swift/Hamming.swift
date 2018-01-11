class Hamming {
    class func compute(_ a: String, against b: String) -> Int? {
        guard a.count == b.count else { return nil }
                
        return zip(a, b).filter { $0 != $1 }.count
    }
}
