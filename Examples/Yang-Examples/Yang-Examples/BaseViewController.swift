//
//  BaseViewController.swift
//  Yang-Examples
//
//  Created by windy on 2023/12/19.
//

import UIKit
import Yang

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
        base()
//        baseBugs()
        
    }
    
    func base() {
        let yellow = YellowView()
        let green = GreenView()
        let red = RedView()
        
        yellow.yang.addToParent(view)
        green.yang.addToParent(view)
        red.yang.addToParent(view)
        
        yellow.yang.edge
            .equalToParent()
            .identifier("yellow-edge")
            .active()
        
        green.yang.left.equalToParent().identifier("green-left").offset(16).active()
        green.yang.right.equalToParent().identifier("green-right").offset(-16).active()
        green.yang.top.equalToParent().identifier("green-top").offset(16).active()
       
        green.yang.height
            .equal(to: 50)
            .identifier("green-height")
            .active()
        
        red.yang.top
            .equal(to: green.yang.bottom)
            .identifier("red.top = green.bottom")
            .offset(20)
            .active()
        
        red.yanglink.leading.trailing.equal(to: green)
            .identifier("red.leading.trailing = green.leading.trailing")
            .active()
        
        red.yang.height.equal(to: green).multiplier(by: 2).active()
    }
    
    func baseBugs() {
     
        let yellow = YellowView()
        let green = GreenView()
        
        yellow.yang.addToParent(view)
        green.yang.addToParent(view)
        
        yellow.yang.size.equal(to: 50).active()
        yellow.yang.center.equalToParent().active()
        
        green.yang.size.equal(to: yellow).active()
        green.yang.center.equal(to: yellow).offsetPoint(CGPoint(x: 0, y: 20)).active()
        
    }
    
}
