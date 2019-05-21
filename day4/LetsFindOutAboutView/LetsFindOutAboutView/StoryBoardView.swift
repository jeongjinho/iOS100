//
//  StoryBoardView.swift
//  LetsFindOutAboutView
//
//  Created by jeongjinho on 21/05/2019.
//  Copyright © 2019 jeongjinho. All rights reserved.
//

import UIKit

class StoryBoardView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override var intrinsicContentSize: CGSize {
       
        print("5-1 intrinsicContentSize StoryBoardView")
        return  CGSize(width: 50, height: 50)
    }
    
    override class var layerClass : AnyClass {
        print("1.layerClass - StoryBoardView")
        return CATiledLayer.self
        
    }
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
        print("2.setNeedsDisplay - StoryBoardView")
    }
    override func addConstraint(_ constraint: NSLayoutConstraint) {
        super.addConstraint(constraint)
        print("3.addConstraint - StoryBoardView")
    }
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        print("4.willMoveToSuperview - StoryBoardView")
    }
    override func invalidateIntrinsicContentSize() {
        super.invalidateIntrinsicContentSize()
        print("5.invalidateIntrinsicContentSize - StoryBoardView")
    }
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        print("6.didMoveToSuperview - StoryBoardView")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        print("7.awakeFromNib - StoryBoardView")
    }
    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toSuperview: newWindow)
         print("8.willMoveToWindow - StoryBoardView")
    }

}
