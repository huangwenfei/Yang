//
//  LayoutConstraintUpdate.swift
//  Yang
//
//  Created by windy on 2023/12/20.
//

import Foundation

public protocol LayoutConstraintUpdateImpl: LayoutUpdatable { }

extension LayoutConstraintUpdateImpl where Self: LayoutConstraintProtocol {
    
    public func updateIfCan() {
        updateIfCan(by: constraint)
    }
    
    internal func updateIfCan(by new: LayoutConstraint) {
        guard let layoutItem = constraint.target.target else {
            return
        }
        
        let formula = new.formula
        let identifier = new.identifier
        
        constraint.constraints.forEach({ constraint in
            let existings = layoutItem.constraints.reduce([], {
                $0 + $1.constraints
            })
            
            guard let update = existings.first(where: { $0 == constraint }) else {
                return
            }
            
            let isUsingFirst = update.secondAttribute == .notAnAttribute
            let attribute = isUsingFirst ? update.firstAttribute : update.secondAttribute
            update.constant = formula.constant.yangContantValue(by: attribute)
            update.priority = formula.priority.yangPriorityUIValue
            update.identifier = identifier
            
        })
    }
    
}
