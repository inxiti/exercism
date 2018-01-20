class Queens {
    enum InitError: Error {
        case incorrectNumberOfCoordinates
        case invalidCoordinates
        case sameSpace
    }
    
    let black: [Int]
    let canAttack: Bool
    let description: String
    let white: [Int]
    
    init(white w: [Int] = [0, 3], black b: [Int] = [7, 3]) throws {
        guard w.count == 2 && b.count == 2 else { throw InitError.incorrectNumberOfCoordinates }
        guard w != b else { throw InitError.sameSpace }
        for n in (w + b) { if n < 0 || n > 7 { throw InitError.invalidCoordinates } }
        
        let canAttackRow = w[0] == b[0]
        let canAttackColumn = w[1] == b[1]
        let canAttackDiagonally = w[0] + w[1] == b[0] + b[1] || w[0] - w[1] == b[0] - b[1]
        
        var tmpBoard = ""
        
        for x in 0...7 {
            for y in 0...7 {
                let character = w == [x, y] ? "W" : b == [x, y] ? "B" : "_"
                
                tmpBoard += character + (y == 7 ? "" : " ")
            }
            
            tmpBoard += x == 7 ? "" : "\n"
        }
        
        white = w
        black = b
        description = tmpBoard
        canAttack = canAttackRow || canAttackColumn || canAttackDiagonally
    }
}
