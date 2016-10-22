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

        UIApplication.shared.isStatusBarHidden = true //隐藏状态栏
        
        self.view.backgroundColor = UIColor.black
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "tableCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell",for: indexPath)
        cell.textLabel?.text = tableData[(indexPath as NSIndexPath).row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 18)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
        
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = colorForIndex((indexPath as NSIndexPath).row)
    }
    
    fileprivate func colorForIndex(_ index: Int) -> UIColor{
        
        let itemCount = tableData.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6  //ToDo:why?
        return UIColor(red: 1.0, green: color, blue: 0.0, alpha: 1.0)
        
    }
}

