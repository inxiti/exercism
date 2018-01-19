import Foundation

class Robot {
    private var _name: String = ""
    
    var name: String {
        get {
            if _name.isEmpty {
                let letters = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
                let index = Int(arc4random_uniform(UInt32(letters.count - 2)))
                let number = arc4random_uniform(899) + 100
                
                _name = "\(letters[index])\(letters[index + 1])\(number)"
            }
            
            return _name
        }
    }
    
    func resetName() {
        _name = ""
    }
}
