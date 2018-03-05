//
//  ViewController.swift
//  StopWatch
//
//  Created by Genki Tomita on 2018/03/05.
//  Copyright © 2018年 Genki Tomita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var stopButton: UIButton!
    @IBOutlet var resetButton: UIButton!
    
    var timer =  Timer()
    var count = 0
    var animals = ["🐭","🐮","🐯","🐰","🐲","🐍","🐴","🐏","🐒","🐓","🐕","🐗"]
    var animalIndex = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        changeButoonState(start: true, stop: false, reset: false)

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tappedStart(sender: UIButton) {
        changeButoonState(start: false, stop: true, reset: false)
        timer = Timer.scheduledTimer(withTimeInterval: 1/100, repeats: true, block: { (timer) in
            self.update()
        })
    }
    
    
    @IBAction func tappedStop(sender: UIButton) {
        changeButoonState(start: true , stop: false, reset: true)
        timer.invalidate()
    }
    
    
    @IBAction func tappedReset(sender: UIButton) {
        changeButoonState(start: true, stop: false, reset: false)
        timer.invalidate()
        count = 0
        timeLabel.text = "00:00:00"
        animalIndex = 0
        animalLabel.text = animals[0]
    }
    
    
    func update() {
        // count
        count += 1
        // animal
        if count % 1200 == 0 {
            animalIndex = 0
            animalLabel.text = animals[0]
        }
        else if count % 100 == 0 {
            animalIndex += 1
            animalLabel.text = animals[animalIndex]
        }
        // time
        let min = count / 60 / 100
        let sec = (count - (min * 60 * 100)) / 100
        let msec = count - (min * 60 * 100) - (sec * 100)
        timeLabel.text = String(format: "%02d:%02d:%02d", min, sec, msec)
    }
    
    
    func changeButoonState(start: Bool, stop: Bool, reset: Bool) {
        startButton.isEnabled = start
        stopButton.isEnabled = stop
        resetButton.isEnabled = reset
    }
    
}

