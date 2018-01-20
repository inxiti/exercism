import Foundation

class PhoneNumber: CustomStringConvertible {
    let areaCode: String
    let description: String
    let number: String
    
    init(_ p: String) {
        let filteredNumber = p.filter { Int(String($0)) != nil }
        
        if filteredNumber.count == 11 && filteredNumber[0] != "1" || filteredNumber.count < 10 {
            number = "0000000000"
        } else {
            number = String(filteredNumber.suffix(10))
        }

        let exchangeCode = String(Array(number)[3...5])
        let subscriberNumber = String(number.suffix(4))
        
        areaCode = number.count == 11 ? String(Array(number)[1...3]) : String(number.prefix(3))
        description = "(\(areaCode)) \(exchangeCode)-\(subscriberNumber)"
    }
}
