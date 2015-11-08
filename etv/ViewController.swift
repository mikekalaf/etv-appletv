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

    var player = AVPlayer(URL: NSURL(string: "http://wowza3.err.ee/live/smil:etv.smil/playlist.m3u")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layer = AVPlayerLayer(player: player)
        
        layer.frame = self.view.frame
        layer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        self.view.layer.addSublayer(layer)
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

