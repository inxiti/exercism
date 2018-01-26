enum TranslationError: Error { case couldNotTranslate }

class ProteinTranslation {
    class func translationOfCodon(_ c: String) throws -> String {
        let codonProtein = [
            "AUG": "Methionine", "UAA": "STOP", "UAG": "STOP", "UGA": "STOP", "UAC": "Tyrosine",
            "UAU": "Tyrosine", "UCA": "Serine", "UCC": "Serine", "UCG": "Serine", "UCU": "Serine",
            "UGC": "Cysteine", "UGU": "Cysteine", "UGG": "Tryptophan", "UUA": "Leucine",
            "UUG": "Leucine", "UUC": "Phenylalanine", "UUU": "Phenylalanine",
        ]
        
        if !codonProtein.keys.contains(c) { throw TranslationError.couldNotTranslate }
        
        return codonProtein[c]!
    }
    
    class func translationOfRNA(_ r: String) throws -> [String] {
        var stopped = false
        
        return try r.enumerated()
            .map { (i, ch) in return i != 0 && i % 3 == 0 ? ",\(ch)" : "\(ch)" }
            .joined()
            .split(separator: ",")
            .flatMap { codon in
                if let c = try? translationOfCodon(String(codon)) {
                    stopped = c == "STOP" ? true : stopped
                    
                    return stopped ? nil : c
                } else { throw TranslationError.couldNotTranslate }
            }
    }
}
