//
//  ViewController.swift
//  customFont
//
//  Created by Hanson on 16/2/28.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var data = ["我是Hanson Zhang","这是测试字体","感谢造字工房，本案例不做商业使用"]
    
    var fontName = ["Gaspar Regular","MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular"]
    
    var fontIndex = 0
    
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var tableFontView: UITableView!
    
    @IBAction func ToChangeFont(sender: AnyObject) {
        
        fontIndex = (fontIndex + 1) % 4
        tableFontView.reloadData()
        print(fontIndex)
    }
    
    //----
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableFontView.dataSource = self
        tableFontView.delegate   = self
        
        for family in UIFont.familyNames(){
            for font in UIFont.fontNamesForFamilyName(family){
                print(font)
            }
        }
        
        //将button改成圆角
        changeButton.layer.cornerRadius = 30
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("fontCell", forIndexPath: indexPath)
        let text = data[indexPath.row]
        
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.blackColor()
        cell.textLabel?.font = UIFont(name: self.fontName[fontIndex], size: 16)
        
        return cell
    }


}
