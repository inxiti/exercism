class Triangle {
    let kind: String

    init(_ a: Double, _ b: Double, _ c: Double) {
        guard a > 0 && b > 0 && c > 0 && a <= b + c && b <= a + c &&  c <=  a + b else {
            kind = "ErrorKind"
            return
        }
        
        if a == b && b == c { kind = "Equilateral" }
        else if a == b || a == c || b == c { kind = "Isosceles" }
        else { kind = "Scalene" }
    }
}
