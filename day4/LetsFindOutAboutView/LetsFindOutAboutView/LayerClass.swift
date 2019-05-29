//
//  LayerClass.swift
//  LetsFindOutAboutView
//
//  Created by jeongjinho on 21/05/2019.
//  Copyright © 2019 jeongjinho. All rights reserved.
//

import UIKit

class LayerClass: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
   
    override class var layerClass : AnyClass {
        print("1.layerClass - LayerClass")
        return CATiledLayer.self
        
    }
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
        print("2.setNeedsDisplay - LayerClass")
    }
    override func addConstraint(_ constraint: NSLayoutConstraint) {
        super.addConstraint(constraint)
        print("3.addConstraint - LayerClass")
    }
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        print("4.willMoveToSuperview - LayerClass")
    }
//    override func invalidateIntrinsicContentSize() {
//        super.invalidateIntrinsicContentSize()
//        print("5.invalidateIntrinsicContentSize - LayerClass")
//    }
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        print("5.didMoveToSuperview - LayerClass")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        print("7.awakeFromNib - LayerClass")
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toSuperview: newWindow)
        print("8.willMoveToWindow - LayerClass")
    }
    override func needsUpdateConstraints() -> Bool {
        super.needsUpdateConstraints()
        print("9.needsUpdateConstraints - LayerClass")
        
        return true
    }
    override func didMoveToWindow() {
        super.didMoveToWindow()
        print("9.didMoveToWindow - LayerClass")
    }
    override func setNeedsLayout() {
        super.setNeedsLayout()
        print("10.setNeedsLayout - LayerClass")
    }
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
         print("10-1.layoutIfNeeded - LayerClass")
    }
    override func draw(_ rect: CGRect) {
        DispatchQueue.main.async {
            super.draw(rect)
            print("11.draw - LayerClass")
        }
      
    }
   
    
}
