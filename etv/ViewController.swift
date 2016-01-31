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
    
    let etvplus = "http://wowza3.err.ee/live/smil:etvpluss.smil/playlist.m3u"
    
    var kava = Kava()
    
    var channel = "etv"
    
    var player = AVPlayer()
    
    var layer = AVPlayerLayer()
    
    @IBOutlet var videoView : UIView!
    
    @IBOutlet var infoView : UIView!
    
    @IBOutlet var currentShowTitle : UILabel!
    
    @IBOutlet var currentShowLead : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layer.player = player
        layer.frame = self.videoView.frame
        layer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        self.videoView.layer.addSublayer(layer)
        
        currentShowLead.lineBreakMode = .ByTruncatingTail;
        
        playChannel("etv")
    }
    
    override func pressesBegan(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
        if (presses.first?.type == .PlayPause) {
            player.pause()
        } else if (presses.first?.type == .Menu) {
            // handle event
            self.toggleChannel()
        } else {
            // perform default action (in your case, exit)
            super.pressesBegan(presses, withEvent: event)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    internal func toggleChannel() {
        if self.channel == "etv" {
            self.playChannel("etv2")
        } else if self.channel == "etv2" {
            self.playChannel("etvplus")
        } else {
            self.playChannel("etv")
        }
    }
    
    internal func playChannel(channel: String) {
        player.pause()
        
        if channel == "etvplus" {
            player = AVPlayer(URL: NSURL(string: etvplus)!)
        } else if channel == "etv2" {
            player = AVPlayer(URL: NSURL(string: etv2)!)
        } else {
            player = AVPlayer(URL: NSURL(string: etv)!)
        }
        
        self.channel = channel
        
        layer.player = player
        layer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        player.play()
        
        self.kava.load(channel, callback: {title, description -> Void in
            
            dispatch_async(dispatch_get_main_queue(), {
                self.currentShowTitle.text = title
                self.currentShowLead.text = description
                
                self.infoView.hidden = false
                
                let delay = 5.0 * Double(NSEC_PER_SEC)
                let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
                dispatch_after(time, dispatch_get_main_queue(), {
                    self.infoView.hidden = true
                })
            })
        })
    }

    
    internal func play() {
        player.play()
    }
    
    internal func pause() {
        player.pause()
    }

}

