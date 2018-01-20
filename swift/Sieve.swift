class Sieve {
    let primes: [Int]
    
    init(_ l: Int) {
        func findPrimes(upTo n: Int) -> [Int] {
            var primes: [Bool] = Array(repeating: true, count: n)

            (primes[0], primes[1]) = (false, false)
            
            for i in 2..<primes.count where primes[i] {
                for j in 2..<primes.count {
                    let ij = i * j
                    
                    if ij < primes.count { primes[ij] = false }
                    else { break }
                }
            }
            
            return primes.enumerated().flatMap { $1 ? $0 : nil }
        }
        
        primes = findPrimes(upTo: l)
    }
}
