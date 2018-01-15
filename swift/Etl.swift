class ETL {
    class func transform(_ old: [Int: [String]]) -> [String: Int] {
        return Dictionary(uniqueKeysWithValues: old.flatMap { (s, ls) in
            ls.map { ($0.lowercased(), s) }
        })
    }
}
