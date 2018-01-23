func flattenArray<T>(_ a: [Any]) -> [T] {
    var result: [T] = []
    
    for element in a {
        if let value = element as? T { result.append(value) }
        if let array = element as? [Any] { result += flattenArray(array) }
    }
    
    return result
}
