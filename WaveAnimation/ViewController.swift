//
//  ViewController.swift
//  WaveAnimation
//
//  Created by LZQ on 16/7/9.
//  Copyright © 2016年 LZQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var waveHeightSlider: UISlider!
    @IBOutlet weak var waveSpeedSlider: UISlider!
    @IBOutlet weak var waveIncreaseSlider: UISlider!
    @IBOutlet weak var wavePeriodSlider: UISlider!
    
    var waveView: WaveView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         创建波浪视图，并且其放置在最下层
         */
        waveView = WaveView(frame: self.view.bounds)
        view.insertSubview(waveView, atIndex: 0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - IB Action
extension ViewController {
    @IBAction func heightValueChanged(sender: AnyObject) {
        waveView.h = view.bounds.height - CGFloat(waveHeightSlider.value)*view.bounds.height
    }
    @IBAction func speedValueChanged(sender: AnyObject) {
        waveView.speed = CGFloat(waveSpeedSlider.value)
    }
    @IBAction func increaseValueChanged(sender: AnyObject) {
        waveView.A = CGFloat(waveIncreaseSlider.value)*100
    }
    @IBAction func wavePeriodValueChanged(sender: AnyObject) {
        waveView.w = CGFloat(wavePeriodSlider.value)*10
    }
}
