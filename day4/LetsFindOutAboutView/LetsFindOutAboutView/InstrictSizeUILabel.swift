//
//  InstrictSizeUILabel.swift
//  LetsFindOutAboutView
//
//  Created by jeongjinho on 21/05/2019.
//  Copyright © 2019 jeongjinho. All rights reserved.
//

import UIKit

class InstrictSizeUILabel: UILabel {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override var intrinsicContentSize: CGSize {
        
        print("5-1 intrinsicContentSize InstrictSizeUILabel")
        return super.intrinsicContentSize
    }
    override class var layerClass : AnyClass {
        print("1.layerClass - InstrictSizeUILabel")
        return CATiledLayer.self
        
    }
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
        print("2.setNeedsDisplay - InstrictSizeUILabel")
    }
    override func addConstraint(_ constraint: NSLayoutConstraint) {
        super.addConstraint(constraint)
        print("3.addConstraint - InstrictSizeUILabel")
    }
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        print("4.willMoveToSuperview - InstrictSizeUILabel")
    }
    override func invalidateIntrinsicContentSize() {
        super.invalidateIntrinsicContentSize()
        print("5.invalidateIntrinsicContentSize - InstrictSizeUILabel")
    }
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        print("6.didMoveToSuperview - InstrictSizeUILabel")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        print("7.awakeFromNib - InstrictSizeUILabel")
    }

}
