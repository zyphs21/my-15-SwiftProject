//
//  ViewController.swift
//  simpleStopWatch
//
//  Created by Hanson on 16/2/21.
//  Copyright © 2016年 hanson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lableTime: UILabel!
    
    var isCounting : Bool = false
    
    var timer : Timer = Timer()
    
    var countNumber : Double = 0
    
    override func viewDidLoad() {
        lableTime.text = String(countNumber)
        super.viewDidLoad()
    }
    

    @IBAction func retSetCount(_ sender: AnyObject) {
        timer.invalidate()
        isCounting = false
        countNumber = 0
        lableTime.text = String(countNumber)
    }

    @IBAction func startCount(_ sender: AnyObject) {
        if isCounting{
            return
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target:self, selector: #selector(ViewController.updateTime),userInfo: nil, repeats: true)
        
        isCounting = true
    }
   
    @IBAction func stopCount(_ sender: AnyObject) {
        timer.invalidate()
        isCounting = false
    }
    
    func updateTime(){
        countNumber = countNumber + 0.1
        //lableTime.text = String(countNumber)
        lableTime.text = String(format: "%.1f", countNumber)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

