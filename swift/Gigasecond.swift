import Foundation

class Gigasecond {
    var description: String = ""
    
    init?(from date: String) {
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        if let formattedDate = dateFormatter.date(from: date) {
            description = dateFormatter.string(from: formattedDate.addingTimeInterval(1_000_000_000.0))
        }
    }
}
