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
                greenH.offset(80).active()
                self.view.setNeedsUpdateConstraints()
                print("4 second later, greenH isActive: ", greenH.isActive)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    redTop.deactive()
                    self.view.setNeedsUpdateConstraints()
                    print("6 second later, redTop isActive: ", redTop.isActive)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        redTop.multiplier(by: 3).offset(40).active()
                        self.view.setNeedsUpdateConstraints()
                        print("8 second later, redTop isActive: ", redTop.isActive)
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            yellowEdge.offsetEdge(30).updateIfCan()
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
                        }
                    }
                }
            }
        }
        
    }
    
}
