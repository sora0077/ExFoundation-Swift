//
//  ViewController.swift
//  Demo
//
//  Created by 林達也 on 2018/02/11.
//  Copyright © 2018年 林達也. All rights reserved.
//

import UIKit
import ExFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        print(all(true, false, true), CC_SHA1_DIGEST_LENGTH)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
