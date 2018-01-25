func isValid(_ i: String) -> Bool {
    let isbn = i.filter { "0123456789X".contains($0) }.map { Int(String($0)) ?? 10 }
    
    guard isbn.count == 10 && !isbn.prefix(9).contains(10) else { return false }

    return (0..<10).map { isbn[$0] * (10 - $0) }.reduce(0, +) % 11 == 0
}
