import Foundation

class Squares {
    var sumOfSquares: Int
    var squareOfSums: Int
    var differenceOfSquares: Int
    
    init(_ n: Int) {
        let numbers = 1...n

        squareOfSums = numbers.reduce(0, +)
        squareOfSums *= squareOfSums
        sumOfSquares = numbers.map { $0 * $0 }.reduce(0, +)
        differenceOfSquares = squareOfSums - sumOfSquares
    }
}
