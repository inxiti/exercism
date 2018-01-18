class Triangle {
    let kind: String
    let triangleKind = (
        Equilateral:"Equilateral",
        Isosceles:"Isosceles",
        Scalene:"Scalene",
        ErrorKind:"ErrorKind"
    )
    
    init(_ a: Double, _ b: Double, _ c: Double) {
        guard (a > 0 && b > 0 && c > 0) && (a <= b + c && b <= a + c &&  c <=  a + b) else {
            kind = triangleKind.ErrorKind
            
            return
        }
        
        if a == b && b == c { kind = triangleKind.Equilateral }
        else if a == b || a == c || b == c { kind = triangleKind.Isosceles }
        else { kind = triangleKind.Scalene }
    }
}

