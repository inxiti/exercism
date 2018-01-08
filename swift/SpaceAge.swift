import Foundation

class SpaceAge {
    let seconds: Double
    
    var onEarth: Double { return orbital(period: 1.0) }
    var onMercury: Double { return orbital(period: 0.2408467) }
    var onVenus: Double { return orbital(period: 0.61519726) }
    var onMars: Double { return orbital(period: 1.8808158) }
    var onJupiter: Double { return orbital(period: 11.862615) }
    var onSaturn: Double { return orbital(period: 29.447498) }
    var onUranus: Double { return orbital(period: 84.016846) }
    var onNeptune: Double { return orbital(period: 164.79132) }
    
    init(_ s: Int) {
        seconds = Double(s)
    }
    
    func orbital(period n: Double) -> Double {
        let percentFormatter = NumberFormatter()

        percentFormatter.numberStyle = NumberFormatter.Style.decimal
        percentFormatter.maximumFractionDigits = 2
        percentFormatter.minimumFractionDigits = 2

        return Double(percentFormatter.string(
            from: NSNumber(value: seconds / (31_557_600.00 * n)))!
        )!
    }
}
