//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

let currentDateTime = NSDate()

let formatStr = "http://etv.err.ee/api/loader/GetTimeLineDay/?day=17&month=1&year=2016"

let dateFormatter = NSDateFormatter()
dateFormatter.dateFormat = "'http://etv.err.ee/api/loader/GetTimeLineDay/?day='d'&month='M'&year='yyyy"

dateFormatter.stringFromDate(currentDateTime)
