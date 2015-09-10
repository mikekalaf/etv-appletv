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

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "http://wowza3.err.ee/live/smil:etv.smil/playlist.m3u"
        
        let player = AVPlayer(URL: NSURL(string: url)!)
        
        let layer = AVPlayerLayer(player: player)
        
        layer.frame = self.view.frame
        layer.backgroundColor = UIColor.redColor().CGColor
        layer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        self.view.layer.addSublayer(layer)
        
        player.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

