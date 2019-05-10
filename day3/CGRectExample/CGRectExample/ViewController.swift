//
//  ViewController.swift
//  CGRectExample
//
//  Created by jeongjinho on 10/05/2019.
//  Copyright © 2019 jeongjinho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     let subImageView = UIImageView(image: UIImage(named:"turtleback"))
    let parentView = UIView(frame:  CGRect(x: 100, y: 100, width: 100, height: 100))
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

       
        let subFrame = CGRect(x: 0, y: 0, width: 1000, height: 1000)
        subImageView.frame = subFrame
        parentView.bounds.origin.x = 900
        parentView.bounds.origin.y = 000
        parentView.addSubview(subImageView)
        parentView.clipsToBounds = true
        self.view.addSubview(parentView)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("sub frame:\(subImageView.frame), bounds: \(subImageView.bounds)")
        
         print("parent frame:\(parentView.frame), bounds: \(parentView.bounds)")
    }

}

