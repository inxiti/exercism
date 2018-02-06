class TwelveDaysSong {
    class func verse(_ v: Int) -> String {
        let days = [
            "first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth",
            "tenth", "eleventh", "twelfth"
        ]
        let gifts = [
            "and a Partridge in a Pear Tree", "two Turtle Doves", "three French Hens",
            "four Calling Birds", "five Gold Rings", "six Geese-a-Laying", "seven Swans-a-Swimming",
            "eight Maids-a-Milking", "nine Ladies Dancing", "ten Lords-a-Leaping",
            "eleven Pipers Piping", "twelve Drummers Drumming"
        ]
        let giftsGiven = (0..<v).reversed().map { ", \(gifts[$0])" }.joined()
        
        return v == 1
            ? "On the first day of Christmas my true love gave to me, a Partridge in a Pear Tree.\n"
            : "On the \(days[v - 1]) day of Christmas my true love gave to me\(giftsGiven).\n"
    }
    
    class func verses(_ b: Int, _ e: Int) -> String {
        return (b...e).map { "\(verse($0))\n" }.joined()
    }

    class func sing() -> String {
        return verses(1, 12)
    }
}
