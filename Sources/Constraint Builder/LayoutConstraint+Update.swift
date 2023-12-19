//
//  LayoutConstraint+Update.swift
//  Yang
//
//  Created by windy on 2023/12/19.
//

import Foundation

extension LayoutConstraint: LayoutUpdatable {
    
    public func updateIfCan() {
        guard let layoutItem = target.target else {
            return
        }
        
        constraints.forEach({ constraint in
            let existings = layoutItem.constraints.reduce([], {
                $0 + $1.constraints
            })
            
            guard let update = existings.first(where: { $0 == constraint }) else {
                return
            }
            
            let attribute = (update.secondAttribute == .notAnAttribute) ? update.firstAttribute : update.secondAttribute
            update.constant = formula.constant.yangContantValue(by: attribute)
            
        })
    }
    
    public func remake() {
        deactive()
        active()
    }
    
}
