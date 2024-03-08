//
//  BaseBatchBuilderViewController.swift
//  Yang-Examples
//
//  Created by windy on 2023/12/19.
//

import UIKit
import Yang

class BaseBatchViewController: UIViewController {
    
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
        
        yellow.yangbatch.make { make in
            make.edge.equalToParent().identifier("yellow-edge")
        }
        
        green.yangbatch.make { make in
            make.left.equalToParent().identifier("green-left").offset(16)
            make.right.equalToParent().identifier("green-right").offset(-16)
            make.top.equalToParent().identifier("green-top").offset(16)
            make.height.equal(to: 50).identifier("green-height")
        }
        
        red.yanglink.top.equal(to: green.yanglink.bottom)
        
        red.yangbatch.make { make in
            make.top
                .equal(to: green.yangbatch.bottom)
                .identifier("red.top = green.bottom")
                .offset(20)
            make.leading
                .equal(to: green)
                .identifier("red.leading = green.leading")
            make.trailing
                .equal(to: green)
                .identifier("red.trailing = green.trailing")
            make.height
                .equal(to: green)
                .multiplier(by: 2)
        }
        
        pink.yangbatch.make { make in
            make.leading.equalToParent()
            make.trailing.equalToParent()
            make.top.equal(to: red.yangbatch.bottom).offset(16)
            make.height.equal(to: 80)
        }
        
    }
    
}

class BatchUpdateViewController: UIViewController {
    
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
        
        yellow.yangbatch.make { make in
            make.edge.equalToParent().identifier("yellow-edge")
        }
        
        purple.yangbatch.make { make in
            make.left.right
                .equalToParent()
                .identifier("purple-left-right")
                .offsetEdge(16)
            make.top.bottom
                .equalToParent()
                .multiplier(by: 0.25)
                .identifier("purple-top-bottom")
                .offsetEdge(16)
        }
        
        brown.yangbatch.make { make in
            make.top
                .equal(to: purple.yangbatch.bottom)
                .identifier("brown.top = purple.bottom")
                .offset(20)
            make.leading.trailing
                .equal(to: purple)
                .identifier("brown.leading.trailing = purple.leading.trailing")
            make.height
                .equal(to: purple)
                .multiplier(by: 2)
        }
        
        pink.yangbatch.make { make in
            make.leading.trailing.equalToParent()
            make.top.equal(to: brown.yangbatch.bottom).offset(16)
            make.height.equal(to: 80)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print("2 second later")
            
            brown.yangbatch.replace { make in
                make.height.equal(to: pink).multiplier(by: 2)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                print("4 second later")
                yellow.yangbatch.remake { make in
                    make.left.right
                        .equalToParent()
                        .offsetEdge(40)
                    make.top
                        .equalToParent()
                    make.bottom
                        .equal(to: pink.yangbatch.bottom)
                        .offsetEdge(-30)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    print("6 second later")
                    purple.yangbatch.update { make in
                        make.left.right
                            .offsetEdge(60)
                        make.top.bottom
                            .offsetEdge(80)
                    }
                }
            }
        }
        
    }
    
}
