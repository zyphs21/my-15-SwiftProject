//
//  ViewController.swift
//  SimplePullToRefresh
//
//  Created by Hanson on 16/3/29.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    //定义数据
    let firstEmojiData = ["😄😄😄😄","😳😳😳😳","😍😍😍😍","😜😜😜😜"]
    let secondEmojiData = ["😁😁😁😁","😘😘😘😘","😂😂😂😂","😆😆😆😆","😄😄😄😄","😳😳😳😳","😍😍😍😍","😜😜😜😜"]
    var emojiData = [String]()
    
    let CELL_IDENTIFER = "cellIdentifer"
    
    //定义组件
    var tableViewController = UITableViewController(style: .Plain)
    var refreshControl = UIRefreshControl()
    var size: CGSize = UIScreen.mainScreen().bounds.size

    var navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: size.width, height: 64))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emojiData = firstEmojiData
        
        let emojiTableView = tableViewController.tableView
        emojiTableView.backgroundColor = UIColor(red: 1, green: 2, blue: 3, alpha: 1)
        emojiTableView.dataSource = self
        emojiTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: CELL_IDENTIFER)
        
        tableViewController.refreshControl = self.refreshControl
        let attributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        //这个selector的方式已经弃用，self.refreshControl.addTarget(self, action: "didLoadEmoji", forControlEvents: .ValueChanged)
        self.refreshControl.addTarget(self, action: #selector(ViewController.didLoadEmoji), forControlEvents: .ValueChanged)
        self.refreshControl.backgroundColor = UIColor(red: 0.013, green: 0.013, blue: 0.145, alpha: 1)
        self.refreshControl.attributedTitle = NSAttributedString(string: "上次刷新的时间是：\(NSDate())", attributes: attributes)
        self.refreshControl.tintColor = UIColor.whiteColor()
        
        self.title = "Show Emoji"
        self.navBar.barStyle = UIBarStyle.BlackTranslucent
        
        emojiTableView.rowHeight = UITableViewAutomaticDimension
        emojiTableView.estimatedRowHeight = 60.0
        emojiTableView.tableFooterView = UIView(frame: CGRectZero)
        emojiTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        
        self.view.addSubview(emojiTableView)
        self.view.addSubview(navBar)

    }

    //UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiData.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CELL_IDENTIFER)! as UITableViewCell
        
        cell.textLabel!.text = self.emojiData[indexPath.row]
        cell.textLabel!.textAlignment = NSTextAlignment.Center
        cell.textLabel!.font = UIFont.systemFontOfSize(50)
        cell.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    
    
    func didLoadEmoji() {
        self.emojiData = secondEmojiData
        self.tableViewController.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

