//
//  ServiceProvider.swift
//  Topshelf
//
//  Created by Priit Haamer on 26.12.15.
//  Copyright © 2015 Priit Haamer. All rights reserved.
//

import Foundation
import TVServices

class ServiceProvider: NSObject, TVTopShelfProvider {

    override init() {
        super.init()
    }

    // MARK: - TVTopShelfProvider protocol

    var topShelfStyle: TVTopShelfContentStyle {
        // Return desired Top Shelf style.
        return .Inset
    }

    var topShelfItems: [TVContentItem] {
        // Create an array of TVContentItems.
        var contentItems = [TVContentItem]()
        
        let etvIdentifier = TVContentIdentifier(identifier: "etv.etv", container: nil)!
        let etvContentItem = TVContentItem(contentIdentifier: etvIdentifier)!
        
        if let etvurl = NSBundle.mainBundle().URLForResource("topshelf-etv", withExtension: "png") {
            etvContentItem.imageURL = etvurl
            etvContentItem.imageShape = .HDTV
            etvContentItem.title = "ETV"
            etvContentItem.displayURL = NSURL(string: "etvapp://etv/")
            etvContentItem.playURL = NSURL(string: "etvapp://etv/")
            
            contentItems.append(etvContentItem)
        }
        
        let etv2Identifier = TVContentIdentifier(identifier: "etv2", container: nil)!
        let etv2ContentItem = TVContentItem(contentIdentifier: etv2Identifier)!
        
        if let etv2url = NSBundle.mainBundle().URLForResource("topshelf-etv2", withExtension: "png") {
            etv2ContentItem.imageURL = etv2url
            etv2ContentItem.imageShape = .HDTV
            etv2ContentItem.title = "ETV 2"
            etv2ContentItem.displayURL = NSURL(string: "etvapp://etv2/")
            etv2ContentItem.playURL = NSURL(string: "etvapp://etv2/")
            
            contentItems.append(etv2ContentItem)
        }
        
        let etvPlusIdentifier = TVContentIdentifier(identifier: "etvplus", container: nil)!
        let etvPlusContentItem = TVContentItem(contentIdentifier: etvPlusIdentifier)!
        
        if let etvPlusurl = NSBundle.mainBundle().URLForResource("topshelf-etvplus", withExtension: "png") {
            etvPlusContentItem.imageURL = etvPlusurl
            etvPlusContentItem.imageShape = .HDTV
            etvPlusContentItem.title = "ETV +"
            etvPlusContentItem.displayURL = NSURL(string: "etvapp://etvplus/")
            etvPlusContentItem.playURL = NSURL(string: "etvapp://etvplus/")
            
            contentItems.append(etvPlusContentItem)
        }
        
        return contentItems
    }

}

