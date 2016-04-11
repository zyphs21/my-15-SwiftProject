//
//  ViewController.swift
//  spotifyLogin
//
//  Created by Hanson on 16/4/2.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

class ViewController: VideoSplashViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpBtton: UIButton!
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.layer.cornerRadius = 5
        signUpBtton.layer.cornerRadius = 5
        
        setUpLoginVideo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setUpLoginVideo(){
        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("loginVideo", ofType: "mp4")!)
        
        videoFrame = view.frame
        fillMode = .ResizeAspectFill
        alwaysRepeat = true
        sound = true
        startTime = 2.0
        alpha = 0.8
        
        contentURL = url
        view.userInteractionEnabled = true
    }


}

