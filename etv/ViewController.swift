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

    let etv = "https://sb.err.ee/live/etv.m3u8"
    
    // let etv = "https://lonestarr.err.ee/live/etvh/index.m3u8?id=59063494668877"
    
    let etv2 = "https://sb.err.ee/live/etv2.m3u8"
    
    let etvplus = "https://sb.err.ee/live/etvpluss.m3u8"
    
    var channel = "etv"
    
    var player = AVPlayer()
    
    var layer = AVPlayerLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layer.player = player
        layer.frame = self.view.frame
        layer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        self.view.layer.addSublayer(layer)
        
        playChannel("etv")
    }
    
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        if (presses.first?.type == .playPause) {
            player.pause()
        } else if (presses.first?.type == .menu) {
            // handle event
            self.toggleChannel()
        } else {
            // perform default action (in your case, exit)
            super.pressesBegan(presses, with: event)
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
    
    internal func playChannel(_ channel: String) {
        player.pause()
        
        if channel == "etvplus" {
            player = AVPlayer(url: URL(string: etvplus)!)
        } else if channel == "etv2" {
            player = AVPlayer(url: URL(string: etv2)!)
        } else {
            player = AVPlayer(url: URL(string: etv)!)
        }
        
        self.channel = channel
        
        layer.player = player
        layer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        player.play()
    }

    
    internal func play() {
        player.play()
    }
    
    internal func pause() {
        player.pause()
    }

}

