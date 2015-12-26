//
//  ViewController.swift
//  etv
//
//  Created by Priit Haamer on 10.09.15.
//  Copyright © 2015 Priit Haamer. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let etv = "http://wowza3.err.ee/live/smil:etv.smil/playlist.m3u"
    
    let etv2 = "http://wowza3.err.ee/live/smil:etv2.smil/playlist.m3u"
    
    var channel = "etv"
    
    var player = AVPlayer()
    
    var layer = AVPlayerLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = AVPlayer(URL: NSURL(string: etv)!)
        
        layer.player = player
        layer.frame = self.view.frame
        layer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        self.view.layer.addSublayer(layer)
    }
    
    override func pressesBegan(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        if (presses.first?.type == UIPressType.Menu) {
            // handle event
            player.pause()
            
            if (self.channel == "etv") {
                player = AVPlayer(URL: NSURL(string: etv2)!)
                self.channel = "etv2"
            } else {
                player = AVPlayer(URL: NSURL(string: etv)!)
                self.channel = "etv"
            }
            
            layer.player = player
            layer.videoGravity = AVLayerVideoGravityResizeAspectFill
            
            player.play()
        } else {
            // perform default action (in your case, exit)
            super.pressesBegan(presses, withEvent: event)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    internal func play() {
        player.play()
    }
    
    internal func pause() {
        player.pause()
    }

}

