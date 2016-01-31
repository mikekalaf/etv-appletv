//: [Previous](@previous)

import Foundation
import XCPlayground

extension NSDate {
    func isGreaterThanDate(dateToCompare : NSDate) -> Bool {
        return self.compare(dateToCompare) == NSComparisonResult.OrderedDescending
    }
    
    func isLessThanDate(dateToCompare : NSDate) -> Bool {
        return self.compare(dateToCompare) == NSComparisonResult.OrderedAscending
    }
}

let dateFormatter = NSDateFormatter()
dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"

//let currentDateTime = NSDate()
let currentDateTime = dateFormatter.dateFromString("2016-01-10T12:10:00+02:00")!

let url: NSURL! = NSBundle.mainBundle().URLForResource("kava", withExtension: "json")

let data = NSData(contentsOfURL: url)

var currentShow : JSON?
var nextShow : JSON?

do {
    let json = try JSON(data: data!)
    
    for row in json {
        let header = row["HeaderLong"].string!
        let start = row["Published"].string!
        let end = row["Updated"].string!
        
        let startTime = dateFormatter.dateFromString(start)!
        let endTime = dateFormatter.dateFromString(end)!
        
        if startTime.isLessThanDate(currentDateTime) && endTime.isGreaterThanDate(currentDateTime) {
            currentShow = row
        }
        
        if startTime.isGreaterThanDate(currentDateTime) && nextShow == nil {
            nextShow = row
        }
    }
    
    currentShow!["HeaderLong"].string!
    nextShow!["HeaderLong"].string!
}
