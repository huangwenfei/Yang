//
//  BaseUpdateViewController.swift
//  Yang-Examples
//
//  Created by windy on 2023/12/21.
//

import UIKit
import Yang

class BaseUpdateViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
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
        
        let redTop = red.yang.top
            .equal(to: green.yang.bottom)
            .identifier("red.top = green.bottom")
            .offset(20)
            .active()
        
        redTop.remake.centerX.equalToParent().active()
        
        
    }
    
}
