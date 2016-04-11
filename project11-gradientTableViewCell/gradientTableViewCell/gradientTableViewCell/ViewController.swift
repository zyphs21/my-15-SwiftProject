//
//  ViewController.swift
//  gradientTableViewCell
//
//  Created by Hanson on 16/4/2.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var tableData = ["早读十分钟", "整理书桌", "外出慢跑二十分钟", "去体育馆玩", "继续做一两个swift项目", "解决一个swift开发中的问题", "打电话给当地", "书写关于swift项目的总结", "买台相机做摄影", "买台无人机来玩", "订一张演唱会门票", "打电话给妈妈爸爸", "测试新做的项目"]

    override func viewDidLoad() {
        super.viewDidLoad()

        UIApplication.sharedApplication().statusBarHidden = true //隐藏状态栏
        
        self.view.backgroundColor = UIColor.blackColor()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        self.tableView.registerClass(TableViewCell.self, forCellReuseIdentifier: "tableCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCell",forIndexPath: indexPath)
        cell.textLabel?.text = tableData[indexPath.row]
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 18)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
        
    }

    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = colorForIndex(indexPath.row)
    }
    
    private func colorForIndex(index: Int) -> UIColor{
        
        let itemCount = tableData.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6  //ToDo:why?
        return UIColor(red: 1.0, green: color, blue: 0.0, alpha: 1.0)
        
    }
}

