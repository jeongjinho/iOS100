//
//  InterfaceBuiderView.swift
//  LetsFindOutAboutView
//
//  Created by jeongjinho on 21/05/2019.
//  Copyright © 2019 jeongjinho. All rights reserved.
//

import UIKit

class InterfaceBuiderView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    override class var layerClass : AnyClass {
        print("1.layerClass - InterfaceBuiderView")
        
        return CATiledLayer.self
        
    }
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
        print("2.setNeedsDisplay - InterfaceBuiderView")
    }
    override func addConstraint(_ constraint: NSLayoutConstraint) {
        super.addConstraint(constraint)
         print("3.addConstraint - InterfaceBuiderView")
    }
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        print("4.willMoveToSuperview - InterfaceBuiderView")
    }
    override func invalidateIntrinsicContentSize() {
        super.invalidateIntrinsicContentSize()
        print("5.invalidateIntrinsicContentSize - InterfaceBuiderView")
    }
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        print("6.didMoveToSuperview - InterfaceBuiderView")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        print("7.awakeFromNib - InterfaceBuiderView")
    }
    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toSuperview: newWindow)
        print("8.willMoveToWindow - InterfaceBuiderView")
    }
    override func needsUpdateConstraints() -> Bool {
        super.needsUpdateConstraints()
        print("9.needsUpdateConstraints - InterfaceBuiderView")
       
        return true
    }
    override func didMoveToWindow() {
        super.didMoveToWindow()
        print("9.didMoveToWindow - InterfaceBuiderView")
    }
    override func setNeedsLayout() {
        super.setNeedsLayout()
        print("10.setNeedsLayout - InterfaceBuiderView")
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        print("11.draw - InterfaceBuiderView")
    }
}

