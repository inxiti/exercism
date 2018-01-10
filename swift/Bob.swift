import Foundation

class Bob {
    class func hey(_ s: String) -> String {
        if s.uppercased() == s && s.rangeOfCharacter(from: CharacterSet.letters) != nil {
            return "Whoa, chill out!"
        }
        if (s.filter { $0 != " " }).isEmpty { return "Fine. Be that way!" }
        if s.suffix(1) == "?" { return "Sure." }

        return "Whatever."
    }
}
