import Foundation

class Robot {
    private var _name: String = ""
    private var _names: Set<String> = []
    
    var name: String {
        get {
            if _name.isEmpty {
                let letters = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
                
                repeat {
                    let index = Int(arc4random_uniform(24))
                    let number = arc4random_uniform(899) + 100
                    
                    _name = "\(letters[index])\(letters[index + 1])\(number)"
                } while _names.contains(_name)
            }
            
            return _name
        }
    }
    
    func resetName() {
        _name = ""
    }
}
