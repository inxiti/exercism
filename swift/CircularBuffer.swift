enum CircularBufferError: Error { case bufferEmpty, bufferFull }

class CircularBuffer<T> {
    let capacity: Int
    
    var buffer: [T?] = []
    var readPosition: Int = 0
    var writePosition: Int = 0
    var isFull: Bool { return (buffer.filter { $0 != nil }).count >= capacity }
    
    func clear() {
        buffer = Array<T?>(repeating: nil, count: capacity)
    }
    
    init(capacity c: Int) {
        capacity = c
        clear()
    }
    
    func incrementWritePosition() { writePosition = (writePosition + 1) % capacity }
    func incrementReadPosition() { readPosition = (readPosition + 1) % capacity }
    
    func read() throws -> T {
        guard let data = buffer[readPosition] else { throw CircularBufferError.bufferEmpty }
        
        buffer[readPosition] = nil
        incrementReadPosition()
            
        return data
    }
    
    func forceWrite(_ n: T) {
        buffer[writePosition] = n
        incrementWritePosition()
    }
    
    func write(_ n: T) throws {
        guard !isFull else { throw CircularBufferError.bufferFull }
        
        forceWrite(n)
    }
    
    func overwrite(_ n: T) {
        if isFull && readPosition == writePosition { incrementReadPosition() }
        
        forceWrite(n)
    }
}
