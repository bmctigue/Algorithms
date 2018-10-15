import Foundation
import XCTest

func hoursArray() -> [String] {
    let timeArray = [
        "twelve",
        "one",
        "two",
        "three",
        "four",
        "five",
        "six",
        "seven",
        "eight",
        "nine",
        "ten",
        "eleven",
        "twelve"
    ]
    return timeArray
}

func minutesArray() -> [String] {
    let timeArray = [
    "",
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight",
    "nine",
    "ten",
    "eleven",
    "twelve",
    "thirteen",
    "fourteen",
    "quarter",
    "sixteen",
    "seventeen",
    "eighteen",
    "nineteen",
    "twenty",
    "twenty one",
    "twenty two",
    "twenty three",
    "twenty four",
    "twenty five",
    "twenty six",
    "twenty seven",
    "twenty eight",
    "twenty nine",
    "half"
    ]
    return timeArray
}
    
func hoursToText(h: Int, m: Int) -> String {
    let h = m > 30 ? h + 1 : h
    let hours = hoursArray()
    return hours[h]
}
    
func minutesToText(_ m: Int) -> String {
    let m = m > 30 ? 60 - m : m
    let minutes = minutesArray()
    return minutes[m]
}
    
func timeSeparator(_ m: Int) -> String {
    if m == 0 {
        return "o' clock"
    }
    
    if m == 30 {
        return "past"
    }
    
    let quarter = Int(m/15)
    switch quarter {
    case 0:
        return "past"
    case 1:
        return "past"
    case 2:
        return "to"
    default:
        return "to"
    }
}

func timeInWords(h: Int, m: Int) -> String {
    let hour = hoursToText(h: h, m: m)
    let minutes = minutesToText(m)
    let separator = timeSeparator(m)
    let quarter = Int(m/15)
    if m % 15 == 0 && quarter == 0 {
        return ("\(hour) \(separator)")
    }
    var pluralMinutes = ""
    if m % 15 != 0 {
        pluralMinutes = m == 1 ? "minute " : "minutes "
    }
    return ("\(minutes) \(pluralMinutes)\(separator) \(hour)")
}

class TimeInWordsTests: XCTestCase {
    
    func testHourToText() {
        var hour = hoursToText(h: 1, m: 0)
        XCTAssert(hour == "one")
        hour = hoursToText(h: 0, m: 0)
        XCTAssert(hour == "twelve")
        hour = hoursToText(h: 12, m: 0)
        XCTAssert(hour == "twelve")
    }

    func testMinutesToText() {
        var minutes = minutesToText(1)
        XCTAssert(minutes == "one")
        minutes = minutesToText(0)
        XCTAssert(minutes == "")
        minutes = minutesToText(15)
        XCTAssert(minutes == "quarter")
        minutes = minutesToText(30)
        XCTAssert(minutes == "half")
    }
    
    func testTimeInWords() {
        var time = timeInWords(h: 1, m: 25)
        XCTAssert(time == "twenty five minutes past one")
        time = timeInWords(h: 7, m: 15)
        XCTAssert(time == "quarter past seven")
        time = timeInWords(h: 5, m: 0)
        XCTAssert(time == "five o' clock")
        time = timeInWords(h: 5, m: 15)
        XCTAssert(time == "quarter past five")
        time = timeInWords(h: 5, m: 30)
        XCTAssert(time == "half past five")
        time = timeInWords(h: 5, m: 45)
        XCTAssert(time == "quarter to six")
        time = timeInWords(h: 5, m: 47)
        XCTAssert(time == "thirteen minutes to six")
        time = timeInWords(h: 5, m: 1)
        XCTAssert(time == "one minute past five")
    }
}

TimeInWordsTests.defaultTestSuite.run()
