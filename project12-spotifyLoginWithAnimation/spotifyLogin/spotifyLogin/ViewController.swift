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
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
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
    
    fileprivate func setUpLoginVideo(){
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "loginVideo", ofType: "mp4")!)
        
        videoFrame = view.frame
        fillMode = .resizeAspectFill
        alwaysRepeat = true
        sound = true
        startTime = 2.0
        alpha = 0.8
        
        contentURL = url
        view.isUserInteractionEnabled = true
    }


}

