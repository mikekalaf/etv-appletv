//
//  JSON.swift
//  Pargi
//
//  Mudel JSONi jaoks, mis lisaks süsteemi poolt pakutavale lisab
//  veel omapoolse tüübikindluse (nii palju kui võimalik)
//
//  Created by Henri Normak on 21/10/15.
//  Copyright © 2015 Henri Normak. All rights reserved.
//

import Foundation

public struct JSON: SequenceType, CustomStringConvertible, JSONLiteralConvertible {
    private let value: AnyObject?
    
    public init(value: AnyObject?) {
        self.value = value
    }
    
    public init(data: NSData) throws {
        let json: AnyObject = try NSJSONSerialization.JSONObjectWithData(data, options: [])
        self.init(value: json)
    }
    
    // MARK: JSONLiteralConvertible
    
    public init(json: JSON) {
        self.value = json.value
    }
    
    // MARK: CustomStringConvertible
    
    public var description: String {
        get {
            return self.value?.description ?? "nil"
        }
    }
    
    // MARK: Tüüpideks konverteerimine
    
    public var isNull: Bool {
        get {
            return self.value == nil || (self.value as? NSNull != nil)
        }
    }
    
    public var string: String? {
        get {
            return self.value as? String
        }
    }
    
    public var URL: NSURL? {
        get {
            if let string = self.string {
                return NSURL(string: string)
            }
            
            return nil
        }
    }
    
    public var date: NSDate? {
        get {
            if let double = self.double {
                return NSDate(timeIntervalSince1970: double)
            }
            
            return nil
        }
    }
    
    public var number: NSNumber? {
        get {
            return self.value as? NSNumber
        }
    }
    
    public var int: Int? {
        get {
            if let number = self.value as? NSNumber {
                return number.integerValue
            }
            
            if let string = self.value as? String {
                return Int(string)
            }
            
            return nil
        }
    }
    
    public var double: Double? {
        get {
            return (self.value as? NSNumber)?.doubleValue
        }
    }
    
    public var bool: Bool? {
        get {
            return (self.value as? NSNumber)?.boolValue
        }
    }
    
    public var dictionary: [String: AnyObject]? {
        get {
            return self.value as? [String: AnyObject]
        }
    }
    
    public var array: [AnyObject]? {
        get {
            return self.value as? [AnyObject]
        }
    }
    
    // MARK: SequenceType
    
    public typealias Generator = AnyGenerator<JSON>
    public func generate() -> Generator {
        var index = 0
        
        return anyGenerator {
            if let array = self.value as? [AnyObject] where array.count > index {
                return JSON(value: array[index++])
            }
            
            return nil
        }
    }
    
    public subscript(key: String) -> JSON {
        get {
            if let dict = self.value as? [String: AnyObject], value: AnyObject = dict[key] {
                return JSON(value: value)
            }
            
            return JSON(value: nil)
        }
    }
    
    public subscript(index: Int) -> JSON {
        get {
            if let array = self.value as? [AnyObject] {
                return JSON(value: array[index])
            }
            
            return JSON(value: nil)
        }
    }
}

//
//  JSONLiteralConvertible
//
//  Protokoll tüüpide jaoks, mida on võimalik JSONist luua
//

public protocol JSONLiteralConvertible {
    init?(json: JSON)
}
