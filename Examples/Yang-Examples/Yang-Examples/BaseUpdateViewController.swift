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
        
        let yellowEdge = yellow.yang.edge
            .equalToParent()
            .identifier("yellow-edge")
            .active()
        
        green.yang.left.equalToParent().identifier("green-left").offset(16).active()
        green.yang.right.equalToParent().identifier("green-right").offset(-16).active()
        green.yang.top.equalToParent().identifier("green-top").offset(16).active()
        
        let greenH = green.yang.height
            .equal(to: 50)
            .identifier("green-height")
            .active()
        
        let redTop = red.yang.top
            .equal(to: green.yang.bottom)
            .identifier("red.top = green.bottom")
            .offset(20)
            .active()
        
        red.yanglink.leading.trailing.equal(to: green)
            .identifier("red.leading.trailing = green.leading.trailing")
            .active()
        
        red.yang.height.equal(to: green).multiplier(by: 2).active()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            greenH.deactive()
            self.view.setNeedsUpdateConstraints()
            print("2 second later, greenH isActive: ", greenH.isActive)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                greenH.updater.offset(80).active()
                self.view.setNeedsUpdateConstraints()
                print("4 second later, greenH isActive: ", greenH.isActive)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    redTop.updater.offset(140).updateIfCan()
                    self.view.setNeedsUpdateConstraints()
                    print("6 second later, redTop isActive: ", redTop.isActive)
                    
                    /// animate
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        print("8 second later, redTop isActive: ", redTop.isActive)
                        yellowEdge.updater.offsetEdge(30).updateIfCan()
                        self.view.setNeedsUpdateConstraints()
                        
                        UIViewPropertyAnimator.runningPropertyAnimator(
                            withDuration: 2,
                            delay: 0,
                            animations: {
                                self.view.layoutIfNeeded()
                            },
                            completion: { position in
                                if position == .end {
                                    green.alpha = 0.6
                                }
                            }
                        )
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            print("10 second later, redTop isActive: ", redTop.isActive)
                            yellowEdge.updater
                                .offsetEdge(8)
                                .updateAnimateIfCan(configs: .init(
                                    duration: 2,
                                    delay: 2,
                                    completion: {
                                        if $0 == .end {
                                            yellow.alpha = 0.7
                                        }
                                    }))
                        }
                    }
                }
            }
        }
        
    }
    
}


class BaseRemakeViewController: UIViewController {
    
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
        
        let yellowEdge = yellow.yang.edge
            .equalToParent()
            .identifier("yellow-edge")
            .active()
        
        green.yang.left.equalToParent().identifier("green-left").offset(16).active()
        green.yang.right.equalToParent().identifier("green-right").offset(-16).active()
        green.yang.top.equalToParent().identifier("green-top").offset(16).active()
        
        let greenH = green.yang.height
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
        
        red.yang.height
            .equal(to: green)
            .multiplier(by: 2)
            .active()
        
        
        pink.yanglink.leading.trailing.equalToParent().active()
        pink.yang.top.equal(to: red.yang.bottom).offset(16).active()
        pink.yang.height.equal(to: 80).active()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print("2 second later")
            greenH.replacer
                .equal(to: pink)
                .multiplier(by: 2)
                .offset(10)
                .active()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                print("4 second later")
                yellowEdge.updater
                    .offset(40)
                    .active()
            }
        }
        
    }
    
}
