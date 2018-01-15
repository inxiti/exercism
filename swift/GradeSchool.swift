class GradeSchool {
    typealias Roster = [Int: [String]]
    
    var roster: Roster = [:]
    var sortedRoster: Roster {
        return Dictionary(uniqueKeysWithValues: roster.map { ($0.0, $0.1.sorted()) })
    }
    
    func addStudent(_ n: String, grade g: Int) {
        roster[g] = roster[g] == nil ? [n] : roster[g]! + [n]
    }
    
    func studentsInGrade(_ g: Int) -> [String] {
        return roster[g] ?? []
    }
}
