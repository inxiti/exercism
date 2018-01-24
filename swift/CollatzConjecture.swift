enum NumberError: Error { case invalid }

class CollatzConjecture {
    class func steps(_ n: Int) throws -> Int {
        guard n > 0 else { throw NumberError.invalid }
        guard n > 1 else { return 0 }

        return try 1 + steps(n % 2 == 0 ? n / 2 : 3 * n + 1)
    }
}
