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
        baseUpdate(view)
//        batch(view)
//        batchUpdate(view)
    }
    
    func base(_ parentView: UIView) {
        let yellow = YellowView()
        yellow.yang.addToParent(parentView)

        #if false
        yellow.yang.edge
            .equalToParent()
            .identifier("yellow-edge")
            .active()
            
        #else
        yellow.yang.left.equalToParent().identifier("yellow-left").offset(16).active()
        yellow.yang.right.equalToParent().identifier("yellow-right").offset(-16).active()
        yellow.yang.top.equalToParent().identifier("yellow-top").offset(16).active()

        yellow.yang.height
            .equal(to: 50)
            .identifier("yellow-height")
            .active()
        #endif
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
            yellowH.updater.offset(280).active()
            self.view.setNeedsUpdateConstraints()
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
            yellow.yangbatch.remake { make in
                make.left.right
                    .equalToParent()
                    .offsetEdge(40)
                make.top
                    .equalToParent()
                    .offset(100)
                make.bottom
                    .equal(to: parentView.yangbatch.bottom)
                    .offsetEdge(50)
            }
        }
    }
    
}
