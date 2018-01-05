enum ParsingError: Error {
    case invalidInput
}

class Nucleotide {
    let DNA: String
    
    init(_ DNA: String) {
        self.DNA = DNA
    }
    
    func complementOfDNA() throws -> String {
        return String(try DNA.map {
            switch $0 {
            case "G": return "C"
            case "C": return "G"
            case "T": return "A"
            case "A": return "U"
            default: throw ParsingError.invalidInput
            }
        })
    }
}
