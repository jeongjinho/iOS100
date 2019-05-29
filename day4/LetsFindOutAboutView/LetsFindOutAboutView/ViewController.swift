//
//  ViewController.swift
//  LetsFindOutAboutView
//
//  Created by jeongjinho on 21/05/2019.
//  Copyright © 2019 jeongjinho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var redRect: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else { return }
            self.redRect = LayerClass.init(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
            self.redRect.backgroundColor = .red
            self.redRect.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
            self.view.addSubview(self.redRect)
            
            let subview = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            subview.backgroundColor = .blue
            self.redRect.addSubview(subview)
        }
       
        
        
    
    }
    @IBAction func touchupInsideMoveButton(_ sender: Any) {
//        self.view.setNeedsDisplay()
   //     redRect.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
     //   redRect.setNeedsDisplay()
    }
}

