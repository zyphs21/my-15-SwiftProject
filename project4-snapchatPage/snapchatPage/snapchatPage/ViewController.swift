//
//  ViewController.swift
//  snapchatPage
//
//  Created by Hanson on 16/3/6.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ScrollView: UIScrollView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarHidden = true
        
        let leftView: LeftView = LeftView(nibName:"LeftView", bundle: nil)
        let centerView: CameraView = CameraView(nibName:"CameraView", bundle: nil)
        let rightView: RightView = RightView(nibName:"RightView", bundle: nil)

        self.addChildViewController(leftView)
        self.ScrollView.addSubview(leftView.view)
        leftView.didMoveToParentViewController(self)
        
        self.addChildViewController(centerView)
        self.ScrollView.addSubview(centerView.view)
        centerView.didMoveToParentViewController(self)
        
        self.addChildViewController(rightView)
        self.ScrollView.addSubview(rightView.view)
        rightView.didMoveToParentViewController(self)
        
        var centerViewFrame: CGRect = centerView.view.frame
        centerViewFrame.origin.x = self.view.frame.width
        centerView.view.frame = centerViewFrame
        
        var rightViewFrame: CGRect = rightView.view.frame
        rightViewFrame.origin.x = 2 * self.view.frame.width
        rightView.view.frame = rightViewFrame
        
        self.ScrollView.contentSize = CGSizeMake(self.view.frame.width * 3, self.view.frame.size.height)
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

