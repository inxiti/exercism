class NumberClassifier {
    enum Classification {
        case abundant
        case deficient
        case perfect
    }
    
    let classification: Classification
    
    init(number n: Int) {
        let sum = (1..<n).filter { n % $0 == 0 }.reduce(0, +)
        
        classification = sum == n ? .perfect : sum > n ? .abundant : .deficient
    }
}
