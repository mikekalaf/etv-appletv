//
//  NSDate.Comparison.swift
//  etv
//
//  Created by Priit Haamer on 31.01.16.
//  Copyright © 2016 Priit Haamer. All rights reserved.
//

import Foundation

extension NSDate {
    func isGreaterThanDate(dateToCompare : NSDate) -> Bool {
        return self.compare(dateToCompare) == NSComparisonResult.OrderedDescending
    }
    
    func isLessThanDate(dateToCompare : NSDate) -> Bool {
        return self.compare(dateToCompare) == NSComparisonResult.OrderedAscending
    }
}
