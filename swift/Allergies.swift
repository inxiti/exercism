class Allergies {
    enum Allergen: Int {
        case eggs = 1, peanuts = 2, shellfish = 4, strawberries = 8, tomatoes = 16, chocolate = 32,
             pollen = 64, cats = 128
    }
    
    let allergy: [Allergen: Bool]
    
    init(_ n: UInt) {
        var number = Int(n)
        var result = [Allergen: Bool]()
        
        while number > 0 {
            for i in stride(from: 6, to: -2, by: -1) {
                let p = 2 << i
                
                if p <= number, let allergen = Allergen.init(rawValue: p) {
                    result[allergen] = true
                    number -= allergen.rawValue
                }
            }
            
            number -= 1
        }
        
        allergy = result
    }
    
    func hasAllergy(_ a: Allergen) -> Bool { return allergy[a] ?? false }
}
