//
//  LoginViewController.swift
//  spotifyLogin
//
//  Created by Hanson on 16/4/2.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var centerAlignUsername: NSLayoutConstraint!
    
    @IBOutlet weak var centerAlignPassword: NSLayoutConstraint!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //页面显示前把两个textfield位置移出屏幕外，并把登录按钮透明显示
        centerAlignPassword.constant -= view.bounds.width
        centerAlignUsername.constant -= view.bounds.width
        loginBtn.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.1, options: UIViewAnimationOptions.curveEaseOut, animations: {
            
            self.centerAlignPassword.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.10, options: .curveEaseOut, animations: {
            
            self.centerAlignUsername.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.20, options: .curveEaseOut, animations: {
            
            self.loginBtn.alpha = 1
            
            }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.layer.cornerRadius = 5
        passwordTextField.layer.cornerRadius = 5
        loginBtn.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


    @IBAction func loginButtonDidPress(_ sender: AnyObject) {
        
        let bounds = self.loginBtn.bounds
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: UIViewAnimationOptions.curveLinear, animations: {
            
                self.loginBtn.bounds = CGRect(x: bounds.origin.x-20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            
            }, completion: nil)
        
        //复原button
        self.loginBtn.bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
