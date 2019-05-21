//
//  ViewController.swift
//  LetsFindOutAboutView
//
//  Created by jeongjinho on 21/05/2019.
//  Copyright © 2019 jeongjinho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // storyBoard is loaded
        //...
        
//        // instance is initialized
//        let layerView = LayerClass.init(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
//        layerView.backgroundColor = .red
//        self.view.addSubview(layerView)
//        layerView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
     
        let interfaceBuilderView = Bundle.main.loadNibNamed("InterfaceBuiderView", owner: self, options: nil)
        self.view.addSubview(interfaceBuilderView!.first as! InterfaceBuiderView)
    }
    

}

