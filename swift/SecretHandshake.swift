class SecretHandshake {
    let actions = [1_000: "jump", 100: "close your eyes", 10: "double blink", 1: "wink" ]
    let commands: [String]
    
    init(_ n: Int) {
        let b = Int(String(n, radix: 2))!
        
        var binaryNumber = b >= 10_000 ? Int(String(String(b - 10_000).reversed()))! : b
        var result: [String] = []
        
        actions.forEach { v, a in
            if binaryNumber >= v {
                result.append(a)
                binaryNumber -= v
            }
        }

        commands = b <= 10_000 ? result.reversed() : result
    }
}
