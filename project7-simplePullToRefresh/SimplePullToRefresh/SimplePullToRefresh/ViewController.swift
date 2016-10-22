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
    var tableViewController = UITableViewController(style: .plain)
    var refreshControl = UIRefreshControl()
    var size: CGSize = UIScreen.main.bounds.size

    var navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 500, height: 64))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emojiData = firstEmojiData
        
        let emojiTableView = tableViewController.tableView
        emojiTableView?.backgroundColor = UIColor(red: 1, green: 2, blue: 3, alpha: 1)
        emojiTableView?.dataSource = self
        emojiTableView?.register(UITableViewCell.self, forCellReuseIdentifier: CELL_IDENTIFER)
        
        tableViewController.refreshControl = self.refreshControl
        let attributes = [NSForegroundColorAttributeName: UIColor.white]
        
        //这个selector的方式已经弃用，self.refreshControl.addTarget(self, action: "didLoadEmoji", forControlEvents: .ValueChanged)
        self.refreshControl.addTarget(self, action: #selector(ViewController.didLoadEmoji), for: .valueChanged)
        self.refreshControl.backgroundColor = UIColor(red: 0.013, green: 0.013, blue: 0.145, alpha: 1)
        self.refreshControl.attributedTitle = NSAttributedString(string: "上次刷新的时间是：\(Date())", attributes: attributes)
        self.refreshControl.tintColor = UIColor.white
        
        self.title = "Show Emoji"
        self.navBar.barStyle = UIBarStyle.blackTranslucent
        
        emojiTableView?.rowHeight = UITableViewAutomaticDimension
        emojiTableView?.estimatedRowHeight = 60.0
        emojiTableView?.tableFooterView = UIView(frame: CGRect.zero)
        emojiTableView?.separatorStyle = UITableViewCellSeparatorStyle.none
        
        
        self.view.addSubview(emojiTableView!)
        self.view.addSubview(navBar)

    }

    //UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiData.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFER)! as UITableViewCell
        
        cell.textLabel!.text = self.emojiData[(indexPath as NSIndexPath).row]
        cell.textLabel!.textAlignment = NSTextAlignment.center
        cell.textLabel!.font = UIFont.systemFont(ofSize: 50)
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        return cell
    }
    
    
    func didLoadEmoji() {
        self.emojiData = secondEmojiData
        self.tableViewController.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

