class Clock: Equatable, CustomStringConvertible {
    private var _minutes: Int
    
    var description: String {
        let minutesWithoutDays = _minutes % 1440
        let totalMinutesOfDay = minutesWithoutDays < 0 ? minutesWithoutDays + 1440 : minutesWithoutDays
        let (hours, minutes) = (totalMinutesOfDay / 60, totalMinutesOfDay % 60)
        
        return "\(hours < 10 ? "0" : "")\(hours):\(minutes < 10 ? "0" : "")\(minutes)"
    }
    
    init(hours h: Int, minutes m: Int = 0) {
        _minutes = (h * 60 + m)
    }
    
    func add(minutes m: Int) -> Clock {
        _minutes += m
        
        return self
    }
    
    func subtract(minutes m: Int) -> Clock {
        _minutes -= m
        
        return self
    }
    
    static func ==(_ lhs: Clock, _ rhs: Clock) -> Bool {
        return lhs.description == rhs.description
    }
    
    static func !=(_ lhs: Clock, _ rhs: Clock) -> Bool {
        return lhs.description != rhs.description
    }
}
