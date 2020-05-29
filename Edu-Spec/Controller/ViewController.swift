//
//  ViewController.swift
//  Edu-Spec
//
//  Created by Cryton Sibanda on 2020/05/23.
//  Copyright © 2020 Cryton Sibanda. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    var videoPlayer:AVPlayer?
    var videoPlayerLayer: AVPlayerLayer? //What the user sees
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpStyle()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        //Setup video in background
        
        setUpVideo()
        
    }
    func setUpVideo(){
        //Get path to the resource in the bundle
        let bundlePath = Bundle.main.path(forResource: "video", ofType: "mp4")
        
        guard bundlePath != nil else { //Makes sure bundle has resource to continue otherswise cancel
            return
        }
        //Create url from bundle
        let url = URL(fileURLWithPath: bundlePath!)
        
        //Create video item
        let item = AVPlayerItem(url: url)

        //Create the player
        videoPlayer = AVPlayer(playerItem: item)
        
        //Create the layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
        //Adjust the size and frame
        videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1,
                                         y: 0, width: self.view.frame.size.width*4,
                                        height: self.view.frame.size.height)
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        //Display and play
        videoPlayer?.playImmediately(atRate: 1)
    }
    
    func setUpStyle(){
        Utilities.styleHollowButton(loginButton)
        Utilities.styleFilledButton(registerButton)
    }
    
    //Navigate to register
    @IBAction func RegisterPressed(_ sender: UIButton) {
        
    }
    
    //Navigate to login
    @IBAction func LoginPressed(_ sender: UIButton) {
        
    }
    
    
}

