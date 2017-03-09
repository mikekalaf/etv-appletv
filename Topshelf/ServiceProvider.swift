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
        return .inset
    }

    var topShelfItems: [TVContentItem] {
        // Create an array of TVContentItems.
        var contentItems = [TVContentItem]()
        
        let etvIdentifier = TVContentIdentifier(identifier: "etv.etv", container: nil)!
        let etvContentItem = TVContentItem(contentIdentifier: etvIdentifier)!
        
        if let etvurl = Bundle.main.url(forResource: "topshelf-etv", withExtension: "png") {
            etvContentItem.imageURL = etvurl
            etvContentItem.imageShape = .HDTV
            etvContentItem.title = "ETV"
            etvContentItem.displayURL = URL(string: "etvapp://etv/")
            etvContentItem.playURL = URL(string: "etvapp://etv/")
            
            contentItems.append(etvContentItem)
        }
        
        let etv2Identifier = TVContentIdentifier(identifier: "etv2", container: nil)!
        let etv2ContentItem = TVContentItem(contentIdentifier: etv2Identifier)!
        
        if let etv2url = Bundle.main.url(forResource: "topshelf-etv2", withExtension: "png") {
            etv2ContentItem.imageURL = etv2url
            etv2ContentItem.imageShape = .HDTV
            etv2ContentItem.title = "ETV 2"
            etv2ContentItem.displayURL = URL(string: "etvapp://etv2/")
            etv2ContentItem.playURL = URL(string: "etvapp://etv2/")
            
            contentItems.append(etv2ContentItem)
        }
        
        let etvPlusIdentifier = TVContentIdentifier(identifier: "etvplus", container: nil)!
        let etvPlusContentItem = TVContentItem(contentIdentifier: etvPlusIdentifier)!
        
        if let etvPlusurl = Bundle.main.url(forResource: "topshelf-etvplus", withExtension: "png") {
            etvPlusContentItem.imageURL = etvPlusurl
            etvPlusContentItem.imageShape = .HDTV
            etvPlusContentItem.title = "ETV +"
            etvPlusContentItem.displayURL = URL(string: "etvapp://etvplus/")
            etvPlusContentItem.playURL = URL(string: "etvapp://etvplus/")
            
            contentItems.append(etvPlusContentItem)
        }
        
        return contentItems
    }

}

