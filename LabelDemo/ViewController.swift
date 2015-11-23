//
//  ViewController.swift
//  LabelDemo
//
//  Created by Broccoli on 15/11/23.
//  Copyright © 2015年 Broccoli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testLabel1: UILabel!
    @IBOutlet weak var testLabel2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // 纯代码添加 UILabel
//        let lbl1 = UILabel(frame: CGRect(x: 30, y: 30, width: 100, height: 10))
//        lbl1.text = "测试字符串:"
//        lbl1.font = UIFont.systemFontOfSize(44.0)
//        lbl1.backgroundColor = UIColor.lightGrayColor()
//        view.addSubview(lbl1)
//        
//        
//                let lbl2 = UILabel(frame: CGRect(x: 30, y: 140, width: 100, height: 10))
//        lbl2.text = "字符串:"
//        lbl2.backgroundColor = UIColor.yellowColor()
//        let dynamicLbl = dynamicWordSpacing(lbl1, dynamicLabel: lbl2, stringRange: NSMakeRange(0, 2))
//        view.addSubview(dynamicLbl)
        // UILabel 在 Storyboard 中
        dynamicWordSpacing(testLabel1, dynamicLabel: testLabel2, stringRange: NSMakeRange(0, 2))
    }
    

    /**
     根据最大字符串宽度 动态修改 字间距 使其 对其
     
     - parameter maxLabel:     宽度最大的 UILabel
     - parameter dynamicLabel: 需要动态修改的 UILabel
     - parameter stringRange:   动态修改的 UILabel 中需要 修改的 string range 的位置
     
     - returns:
     */
    func dynamicWordSpacing(maxLabel: UILabel, dynamicLabel: UILabel, stringRange: NSRange) {
        maxLabel.sizeToFit()
        let maxWidth = maxLabel.bounds.width
        
        dynamicLabel.sizeToFit()
        let dynamicWidth = dynamicLabel.bounds.width
        
        let differenceValue = (maxWidth - dynamicWidth) / CGFloat(stringRange.length)
        
        let attributesString = NSMutableAttributedString(string: dynamicLabel.text!)
        attributesString.addAttribute(NSKernAttributeName, value: differenceValue, range: stringRange)
        
        dynamicLabel.text = ""
        dynamicLabel.attributedText = attributesString
        dynamicLabel.sizeToFit()
    }
}

