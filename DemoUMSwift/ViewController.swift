//
//  ViewController.swift
//  DemoUMSwift
//
//  Created by tt on 2021/12/6.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 
        DispatchQueue.main.asyncAfter(deadline: .now()+5.0) {
            print(UMRemoteConfig.configValue(forKey: "ad_source") ?? "novalue")
        }
    }
    
}

