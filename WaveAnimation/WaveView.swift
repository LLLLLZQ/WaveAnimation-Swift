//
//  WaveView.swift
//  WaveAnimation
//
//  Created by LZQ on 16/7/9.
//  Copyright © 2016年 LZQ. All rights reserved.
//

import UIKit

class WaveView: UIView {
    
    /*
     运动轨迹遵循正弦规则：y=Asin(ax+b)+h
     */
    
    /*A: 波浪的增幅*/
    var A: CGFloat {
        didSet {
            self.createTimer()
        }
    }
    
    /*波浪的速度*/
    var speed: CGFloat {
        didSet {
            self.createTimer()
        }
    }
    
    /*波浪的高度*/
    var h: CGFloat {
        didSet {
            self.createTimer()
        }
    }
    
    /*波浪的周率*/
    var w: CGFloat {
        didSet {
            self.createTimer()
        }
    }
    
    var link: CADisplayLink!
    var b: CGFloat = 0
    
    override init(frame: CGRect) {
        A = 0
        speed = 0
        h = frame.size.height
        w = 0
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        b += speed
        
        let context = UIGraphicsGetCurrentContext()
        
        let path = CGPathCreateMutable()
        CGContextSetLineWidth(context, 1)
        CGContextSetFillColorWithColor(context, UIColor(red: 0, green: 0, blue: 1, alpha: 0.3).CGColor)
        let startY = h
        CGPathMoveToPoint(path, nil, 0, startY)
        
        var i: CGFloat = 0.0
        while i < rect.width {
            let wx = w*i/180*CGFloat(M_PI)
            let y = A * CGFloat(sinf(Float(wx + b))) + h
            CGPathAddLineToPoint(path, nil, i, y)
            i += 1.0
        }
        CGPathAddLineToPoint(path, nil, rect.width, rect.height)
        CGPathAddLineToPoint(path, nil, 0, rect.height)
        CGContextAddPath(context, path)
        CGContextFillPath(context)
        CGContextDrawPath(context, CGPathDrawingMode.Stroke)
    }
}

extension WaveView {
    /*
     CADisplayLink是一个能让我们以和屏幕刷新率同步的频率将特定的内容画到屏幕上的定时器类
     */
    func createTimer() {
        if (link == nil) {
            link = CADisplayLink(target: self, selector: #selector(WaveView.startAnimation))
            link.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
        }
    }
    
    /*
     重新绘制WaveView
     */
    func startAnimation() {
        self.setNeedsDisplay()
    }
}