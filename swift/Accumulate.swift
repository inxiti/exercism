extension Array {
    func accumulate<T>(_ f: (Element) -> T) -> [T] {
        var accumulator: [T] =  []

        for element in self { accumulator.append(f(element)) }

        return accumulator
    }
}
