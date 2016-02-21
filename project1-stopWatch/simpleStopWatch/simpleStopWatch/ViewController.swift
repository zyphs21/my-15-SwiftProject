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
    
    var timer : NSTimer = NSTimer()
    
    var countNumber : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    @IBAction func retSetCount(sender: AnyObject) {
        timer.invalidate()
        isCounting = false
        countNumber = 0
        lableTime.text = String(countNumber)
    }

    @IBAction func startCount(sender: AnyObject) {
        if isCounting{
            return
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target:self, selector: Selector("updateTime"),userInfo: nil, repeats: true)
        
        isCounting = true
    }
   
    @IBAction func stopCount(sender: AnyObject) {
        timer.invalidate()
        isCounting = false
    }
    
    func updateTime(){
        countNumber = countNumber + 0.1
        lableTime.text = String(countNumber)
        //lableTime.text = String(format: "%.1f", countNumber)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

