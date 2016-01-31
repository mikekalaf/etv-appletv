//
//  Kava.swift
//  etv
//
//  Created by Priit Haamer on 17.01.16.
//  Copyright © 2016 Priit Haamer. All rights reserved.
//

import Foundation

public struct Kava {
    
    private let isLoaded = false
    
    private var etvKava : JSON?
    
    private var etv2Kava : JSON?
    
    private var etvPlussKava : JSON?
    
    public func getTitle(channel: String) -> String {
        return "Jolo"
    }
    
    public func getDescription(channel: String) -> String {
        return "Description"
    }
    
    public mutating func load(channel: String, callback: (title: String?, description: String?) -> Void) {
        let currentDateTime = NSDate()
        
        let urlFormatter = NSDateFormatter()
        urlFormatter.dateFormat = "'http://\(channel).err.ee/api/loader/GetTimeLineDay/?day='d'&month='M'&year='yyyy"
        
        let urlPath = urlFormatter.stringFromDate(currentDateTime)
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
        
        let url: NSURL = NSURL(string: urlPath)!
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
            do {
                self.etvKava = try JSON(data: data!)
                
                for row in self.etvKava! {
                    let header = row["HeaderLong"].string
                    let lead = row["Lead"].string
                    let start = row["Published"].string!
                    let end = row["Updated"].string!
                    
                    let startTime = dateFormatter.dateFromString(start)!
                    let endTime = dateFormatter.dateFromString(end)!
                    
                    if startTime.isLessThanDate(currentDateTime) && endTime.isGreaterThanDate(currentDateTime) {
                        callback(title: header, description: lead)
                    }
                }
            } catch {
            }
        })
        task.resume()
    }
    
}
