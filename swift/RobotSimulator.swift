class SimulatedRobot {
    enum Direction {
        case east, north, south, west
    }
    
    enum Instructions {
        case advance, turnLeft, turnRight
    }
    
    var bearing: Direction = .north
    var coordinates: [Int] = []
    
    func at(x: Int, y: Int) {
        coordinates = [x, y]
    }
    
    func orient(_ d: Direction) {
        bearing = d
    }
    
    func turnRight() {
        switch bearing {
        case .east: bearing = .south
        case .north: bearing = .east
        case .south: bearing = .west
        case .west: bearing = .north
        }
    }
    
    func turnLeft() {
        switch bearing {
        case .east: bearing = .north
        case .north: bearing = .west
        case .south: bearing = .east
        case .west: bearing = .south
        }
    }
    
    func advance() {
        switch bearing {
        case .east: coordinates[0] += 1
        case .north: coordinates[1] += 1
        case .south: coordinates[1] -= 1
        case .west: coordinates[0] -= 1
        }
    }
    
    func place(x: Int, y: Int, direction d: Direction) {
        bearing = d
        coordinates = [x, y]
    }
    
    func instructions(_ ins: String) -> [Instructions] {
        return ins.map {
            switch $0 {
            case "L": return .turnLeft
            case "R": return .turnRight
            default: return .advance
            }
        }
    }
    
    func evaluate(_ s: String) {
        s.forEach {
            instructions(String($0)).forEach {
                switch $0 {
                case .turnLeft: turnLeft()
                case .turnRight: turnRight()
                default: advance()
                }
            }
        }
    }
}
