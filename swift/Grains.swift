import Foundation

struct Grains {
    enum GrainsError: Error {
        case inputTooLow(_: String)
        case inputTooHigh(_: String)
    }
    
    static var total: UInt64 = UInt64.max

    static func square(_ n: Int) throws -> UInt64 {
        if n < 1 {
            throw GrainsError.inputTooLow("Input[\(n)] invalid. Input should be between 1 and 64 (inclusive)")
        }
        
        if n > 64 {
            throw GrainsError.inputTooHigh("Input[\(n)] invalid. Input should be between 1 and 64 (inclusive)")
        }

        return UInt64(pow(2.0, Double(n - 1)))
    }
}

