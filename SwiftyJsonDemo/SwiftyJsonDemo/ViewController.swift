//
//  ViewController.swift
//  SwiftyJsonDemo
//
//  Created by wangcong on 06/06/2017.
//  Copyright © 2017 ApterKing. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        var jsonData: Data?
        if let file = Bundle.main.path(forResource: "SwiftyJSON", ofType: "json") {
            jsonData = try? Data(contentsOf: URL(fileURLWithPath: file))
        } else {
            print("Fail")
        }

        let jsonObject = try? JSONSerialization.jsonObject(with: jsonData!, options: .allowFragments) as? [[String: AnyObject]]

        let jsonString = String(data: jsonData!, encoding: .utf8)

        /* ----- JSON初始化 ----- */

        // 通过data装初始化
        let json1 = try? JSON(data: jsonData!)

        /* 通过object初始化
          * object参数可以是： NSString/String, NSNumber/Int/Float/Double/Bool, NSArray/Array, NSDictionary/Dictionary, or NSNull;
          * 但是这个方法是不处理包含JsonString字符串的，它提供了一个单独的初始化方式，并且你的Dictionary的key最好是只包含NSString/String
        */
        let json2 = JSON(jsonObject as Any)

        // 通过JsonString 初始化
        let json3 = JSON(parseJSON: jsonString!)

        /* ------ JSON合并 ------ */
        let jsonMerge = try? json1?.merged(with: json2)

        var address = jsonMerge??["address"].string

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
