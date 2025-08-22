//
//  ReadmeExampleController.swift
//  Yang-Examples
//
//  Created by windy on 2024/3/8.
//

import UIKit
import Yang

class ReadmeExampleController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
//        base(view)
//        baseUpdate(view)
//        batch(view)
        batchUpdate(view)
    }
    
    func base(_ parentView: UIView) {
        
        let yellow = YellowView()
        yellow.yang.addToParent(parentView)

//        base(target: yellow)
//        base1(target: yellow)
        
        let red = RedView()
        red.yang.addToParent(parentView)
        
        base2(target: yellow, other: red)
        
    }
    
    func base(target yellow: UIView) {
        yellow.yang.edge
            .equalToParent()
            .identifier("yellow-edge")
            .active()
    }
    
    func base1(target yellow: UIView) {
        yellow.yang.left.equalToParent().identifier("yellow-left").offset(16).active()
        yellow.yang.right.equalToParent().identifier("yellow-right").offset(-16).active()
        yellow.yang.top.equalToParent().identifier("yellow-top").offset(16).active()

        yellow.yang.height
            .equal(to: 50)
            .identifier("yellow-height")
            .active()
    }
    
    func base2(target yellow: UIView, other red: UIView) {
        yellow.yang.left.equalToParent().identifier("yellow-left").offset(16).active()
        yellow.yang.right.equalToParent().identifier("yellow-right").offset(-16).active()
        yellow.yang.top.equalToParent().identifier("yellow-top").offset(16).active()

        yellow.yang.height
            .equal(to: 50)
            .identifier("yellow-height")
            .active()
        
        red.yang.top.equal(to: yellow.yang.bottom).offset(16).identifier("red-top = yellow.bottom").active()
        red.yang.height.equal(to: yellow).identifier("red-height = yellow.height").active()
        red.yanglink.leading.trailing.equal(to: yellow).identifier("red-leading-trailing = yellow-leading-trailing").active()
        
    }
    
    
    func baseUpdate(_ parentView: UIView) {
        let yellow = YellowView()
        yellow.yang.addToParent(parentView)

        yellow.yang.left.equalToParent().identifier("yellow-left").offset(16).active()
        yellow.yang.right.equalToParent().identifier("yellow-right").offset(-16).active()
        yellow.yang.top.equalToParent().identifier("yellow-top").offset(16).active()

        let yellowH = yellow.yang.height
            .equal(to: 50)
            .identifier("yellow-height")
            .active()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            /// set new value
            yellowH.updater.offset(280)
            /// update it
            yellowH.updater.updateAnimateIfCan(configs: .init())
        }
    }
    
    func batch(_ parentView: UIView) {
        let yellow = YellowView()
        yellow.yang.addToParent(parentView)

        yellow.yangbatch.make { make in
            make.left.equalToParent().identifier("yellow-left").offset(46)
            make.right.equalToParent().identifier("yellow-right").offset(-46)
            make.top.equalToParent().identifier("yellow-top").offset(46)
            make.height.equal(to: 150).identifier("yellow-height")
        }
    }
    
    func batchUpdate(_ parentView: UIView) {
        let yellow = YellowView()
        yellow.yang.addToParent(parentView)

        yellow.yangbatch.make { make in
            make.left.equalToParent().identifier("yellow-left").offset(16)
            make.right.equalToParent().identifier("yellow-right").offset(-16)
            make.top.equalToParent().identifier("yellow-top").offset(16)
            make.height.equal(to: 50).identifier("yellow-height")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            yellow.yangbatch.updateAnimate({ make in
                make.left.offsetEdge(140)
                make.right.offsetEdge(140)
                make.top.offset(100)
            }, animateConfigs: .init())
        }
    }
    
}
