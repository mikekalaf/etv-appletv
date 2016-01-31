//: Playground - noun: a place where people can play

import UIKit

let url: NSURL! = NSBundle.mainBundle().URLForResource("kava", withExtension: "json")

do {
    let fileContent = try NSString(contentsOfURL: url, encoding: NSUTF8StringEncoding)
} catch let error as NSError {
    print("Error: \(error)")
}
