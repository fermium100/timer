//
//  ViewController.swift
//  timer
//
//  Created by User on 2015/08/08.
//  Copyright (c) 2015年 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //タイマー
    var timer: NSTimer!
    var cnt: Float = 0
    @IBOutlet var label : UILabel!
    @IBOutlet var bg : UIImageView!
    @IBOutlet weak var setTimeOut: UIStepper!
    var black : UIImage!
    var white : UIImage!
    var ope : Int = 0
    var timeOut : Float = 10.0

    override func viewDidLoad() {
        super.viewDidLoad()
        black = UIImage(named: "black.jpg")
        white = UIImage(named: "white.png")
        label.text = timeOut.description
    }
  
    
  @IBAction func stepperValueChanged(sender: UIStepper) {
        timeOut = max(1,Float(sender.value))
        label.text = timeOut.description
  }
    @IBAction func timerBtn(sender: UIButton) {
        
        cnt = 0
        ope = ope + 1
        //タイマーを作る.
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
        println(ope)
        
        if ope % 2 == 0{
            bg.image = black
        }
        if ope % 2 == 1{
            bg.image = white
        }
        
    }
    @IBAction func timerstop(sender: UIButton) {
        cnt = 0
        ope = ope + 1
        
        if ope % 2 == 0{
            bg.image = black
        }
        if ope % 2 == 1{
            bg.image = white
        }
        
    }
    
    func onUpdate(timer : NSTimer){
        cnt += 0.1
		label.text = String(format: "%.1f", cnt)
        if cnt > timeOut {
            if timer.valid  {
                //timerを停止する.
                timer.invalidate()
                label.text = String("Gameover")
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

