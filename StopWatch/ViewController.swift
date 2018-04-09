//
//  ViewController.swift
//  StopWatch
//
//  Created by Genki Tomita on 2018/03/05.
//  Copyright © 2018年 Genki Tomita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var stopButton: UIButton!
    @IBOutlet var resetButton: UIButton!
    
    var timer = Timer()
    var count = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tappedStart(sender: UIButton) {
        timer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: { (timer) in
            self.update()
        })
    }
    
    
    @IBAction func tappedStop(sender: UIButton) {
        timer.invalidate()
    }
    
    
    @IBAction func tappedReset(sender: UIButton) {
        timer.invalidate()
        count = 0
        timeLabel.text = "00:00:00"
        
    }
    
    
    func update() {
        // count
        count += 1
        
        // time
        let min = count / 60 / 100
        let sec = (count - (min * 60 * 100)) / 100
        let msec = count - (min * 60 * 100) - (sec * 100)
        timeLabel.text = String(format: "%02d:%02d:%02d", min, sec, msec)
    }
    
}

