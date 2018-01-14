class Raindrops {
    let sounds: String
    
    init(_ n: Int) {
        let factors = [3: "Pling", 5: "Plang", 7: "Plong"]
        let result = factors.keys.sorted().flatMap { k in n % k == 0 ? factors[k] : nil }

        sounds = result.isEmpty ? String(n) : result.joined()
    }
}
