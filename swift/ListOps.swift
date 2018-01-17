func append(_ ls: [Int]...) -> [Int] {
    return ls.flatMap { $0 }
}

func concat(_ ls: [Int]...) -> [Int] {
    return ls.flatMap { $0 }
}

func filter(_ l: [Int], _ f: (Int) -> Bool) -> [Int] {
    return l.flatMap { f($0) ? $0 : nil }
}

func length(_ l: [Int]) -> Int {
    return foldLeft(map(l, { x in 1 }), accumulated:  0, combine: +)
}

func map(_ l: [Int], _ f: (Int) -> Int) -> [Int] {
    var result: [Int] = []
    
    l.forEach { result.append(f($0)) }
    
    return result
}

func foldLeft(_ l: [Int], accumulated: Int, combine: (Int, Int) -> Int) -> Int {
    var result = accumulated
    
    for i in l {
        result = combine(result, i)
    }
    
    return result
}

func foldRight<T>(_ l: [T], accumulated: T, combine: (T, T) -> T) -> T {
    var result = accumulated
    
    for i in l.reversed() {
        result = combine(i, result)
    }
    
    return result
}

func reverse(_ l: [Int]) -> [Int] {
    return stride(from: (length(l) - 1), through: 0, by: -1).flatMap { l[$0] }
}
