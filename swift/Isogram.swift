import Foundation

class Isogram {
    class func isIsogram(_ s: String) -> Bool {
        let f = String(s.trimmingCharacters(in: .whitespaces).lowercased().filter {
            CharacterSet.letters.contains(Unicode.Scalar(String($0))!)
        })
        
        return Set(f).count == f.count
    }
}
