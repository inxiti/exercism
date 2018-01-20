enum Plant: String {
    case grass      = "G"
    case clover     = "C"
    case radishes   = "R"
    case violets    = "V"
}

class Garden {
    private let _garden: [String]
    private let _children: [String]
    
    init(_ g: String, children c: [String]? = nil) {
        _garden = g.split(separator: "\n").map { String($0) }
        _children = c?.sorted() ?? [
            "Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana",
            "Joseph", "Kincaid", "Larry"
        ]
    }
    
    func plantsForChild(_ c: String) -> [Plant] {
        let index = (_children.index(of: c) ?? 0) * 2
        let garden = _garden.map { r in
                let start = r.index(r.startIndex, offsetBy: index)
                let end   = r.index(r.startIndex, offsetBy: index + 2)

                return r[start..<end]
        }.joined()

        return garden.flatMap { Plant(rawValue: String($0)) }
    }
}
