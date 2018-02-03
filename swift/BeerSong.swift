class BeerSong {
    let amount: Int
    
    init(numberOfBeerBottles n: Int) {
        amount = n
    }
    
    func generateVersesOfBeerSong() -> String {
        return stride(from: amount, through: 0, by: -1).map { x in
            guard x > 0 else { return "No more bottles of beer on the wall, no more bottles of "
                + "beer.\nGo to the store and buy some more, 99 bottles of beer on the wall." }
            
            let firstPhrase  = "\(x) " + (x == 1 ? "bottle" : "bottles")
            let secondPhrase = x == 1 ? "no more bottles" : "\(x - 1) " + (x == 2 ? "bottle" : "bottles")
            
            return "\(firstPhrase) of beer on the wall, \(firstPhrase) of beer.\nTake one down and "
                + "pass it around, \(secondPhrase) of beer on the wall.\n\n"
            }.joined()
    }
}
