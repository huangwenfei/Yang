//
//  BaseBuilderViewController.swift
//  Yang-Examples
//
//  Created by windy on 2023/12/19.
//

import UIKit
import Yang

class BaseBuilderViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
        let yellow = YellowView()
        let green = GreenView()
        let red = RedView()
        let pink = PinkView()
        
        yellow.yang.addToParent(view)
        green.yang.addToParent(view)
        red.yang.addToParent(view)
        pink.yang.addToParent(view)
        
        yellow.yang.make { maker in
            maker.edge.equalToParent().identifier("yellow-edge")
        }
        
        green.yang.make { maker in
            maker.left.equalToParent().identifier("green-left").offset(16)
            maker.right.equalToParent().identifier("green-right").offset(-16)
            maker.top.equalToParent().identifier("green-top").offset(16)
            maker.height.equal(to: 50).identifier("green-height")
        }
        
        red.yang.make { maker in
            maker.top
                .equal(to: green.yang.bottom)
                .identifier("red.top = green.bottom")
                .offset(20)
            maker.leading
                .equal(to: green)
                .identifier("red.leading = green.leading")
            maker.trailing
                .equal(to: green)
                .identifier("red.trailing = green.trailing")
            maker.height
                .equal(to: green)
                .multiplier(by: 2)
        }
        
        pink.yang.make { maker in
            maker.leading.equalToParent()
            maker.trailing.equalToParent()
            maker.top.equal(to: red.yang.bottom).offset(16)
            maker.height.equal(to: 80)
        }
        
        
    }
    
}

class BaseLinkBuilderViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
        let yellow = YellowView()
        let purple = PurpleView()
        let brown = BrownView()
        let pink = PinkView()
        
        yellow.yang.addToParent(view)
        purple.yang.addToParent(view)
        brown.yang.addToParent(view)
        pink.yang.addToParent(view)
        
        yellow.yanglink.make { maker in
            maker.edge.equalToParent().identifier("yellow-edge")
        }
        
        purple.yanglink.make { maker in
            maker.left.right
                .equalToParent()
                .identifier("green-left-right")
                .offsetEdge(16)
            maker.top.bottom
                .equalToParent()
                .multiplier(by: 0.25)
                .identifier("green-top-bottom")
                .offsetEdge(16)
        }
        
        brown.yanglink.make { maker in
            maker.top
                .equal(to: purple.yang.bottom)
                .identifier("red.top = green.bottom")
                .offset(20)
            maker.leading.trailing
                .equal(to: purple)
                .identifier("red.leading.trailing = green.leading.trailing")
            maker.height
                .equal(to: purple)
                .multiplier(by: 2)
        }
        
        pink.yanglink.make { maker in
            maker.leading.trailing.equalToParent()
            maker.top.equal(to: brown.yang.bottom).offset(16)
            maker.height.equal(to: 80)
        }
        
        
    }
    
}
