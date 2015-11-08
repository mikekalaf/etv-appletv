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
        
        NSLog("View did load")
        
        super.viewDidLoad()
        
        let layer = AVPlayerLayer(player: player)
        
        layer.frame = self.view.frame
        layer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        self.view.layer.addSublayer(layer)
    }
    
    override func viewWillDisappear(animated: Bool) {
        NSLog("view did disappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    internal func play() {
        player.play()
    }
    
    internal func pause() {
        player.pause()
    }

}

