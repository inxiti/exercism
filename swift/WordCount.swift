class WordCount {
    let words: [String]
    
    init(words w: String) {
        words = w
            .lowercased()
            .filter { "abcdefghijklmnopqrstuvwxyz1234567890 ".contains($0) }
            .split(separator: " ")
            .flatMap { String($0) }
    }
    
    func count() -> Dictionary<String, Int> {
        return words
            .reduce(into: [:]) { $0[String($1)] = ($0[String($1)] ?? 0) + 1 }
    }
}
