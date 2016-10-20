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
    
    @IBAction func ToChangeFont(_ sender: AnyObject) {
        
        fontIndex = (fontIndex + 1) % 4
        tableFontView.reloadData()
        print(fontIndex)
    }
    
    //----
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableFontView.dataSource = self
        tableFontView.delegate   = self
        
        for family in UIFont.familyNames{
            for font in UIFont.fontNames(forFamilyName: family){
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "fontCell", for: indexPath)
        let text = data[(indexPath as NSIndexPath).row]
        
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.font = UIFont(name: self.fontName[fontIndex], size: 16)
        
        return cell
    }


}
