class DNA {
    let strand: String
    let symbols = "ACGT"
    
    func counts() -> [String: Int] {
        var dict: [String: Int] = [:]

        symbols.forEach { dict[String($0)] = count(String($0)) }
        
        return dict
    }
    
    func count(_ ch: String) -> Int {
        return strand.filter { String($0) == ch }.count
    }
    
    init?(strand s: String) {
        for symbol in s {
            if !symbols.contains(symbol) { return nil }
        }
        
        strand = s
    }
}
