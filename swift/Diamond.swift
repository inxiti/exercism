class Diamond {
    class func makeDiamond(letter l: String) -> [String] {
        func createHalfOfKata(upTo l: String) -> [String] {
            let letters = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
            let index = letters.index(of: Character(l))!
            
            return letters[...letters.index(of: Character(l))!].map { letter in
                let spaces = index * 2 - 1
                let paddedSpaces = index - letters.index(of: letter)!
                let padding = String(repeating: " ", count: paddedSpaces)
  
                if letter != "A" {
                    let middlePadding = String(repeating: " ", count: spaces - (paddedSpaces * 2))
                    
                    return "\(padding)\(letter)\(middlePadding)\(letter)\(padding)"
                } else {
                    return "\(padding)\(letter)\(padding)"
                }
            }
        }
        
        return createHalfOfKata(upTo: l) + createHalfOfKata(upTo: l).dropLast().reversed()
    }
}
