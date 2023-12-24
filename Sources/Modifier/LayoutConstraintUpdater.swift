//
//  LayoutConstraintUpdater.swift
//  Yang
//
//  Created by windy on 2023/12/23.
//

import UIKit

internal struct LayoutConstraintUpdater {
    
    internal static func updateIfCan(old constraint: LayoutConstraint, new: LayoutConstraint) {
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
    
    internal static func replaceIfCan(old: LayoutConstraint, new: LayoutConstraint) -> Bool {
        
        guard old.isActive else { return false }
        
        var shouldReactive = false
        
        /// - Tag: Relate
        if new.related != old.related {
            old.deactive()
            shouldReactive = true
        }
        
        /// - Tag: Multiplier
        let newMultiplier = new.formula.multiplier.yangMultiplierValue
        let oldMultiplier = old.formula.multiplier.yangMultiplierValue
        if newMultiplier != oldMultiplier {
            old.deactive()
            shouldReactive = true
        }
        
        /// - Tag:  Identifier / Priority / Offset
        if shouldReactive == false {
            old.identifier = new.identifier
            old.formula.priority = new.formula.priority
            old.formula.constant = new.formula.constant
            
            old.updateIfCan()
        }
        
        return shouldReactive
        
    }
    
    internal static func animate(_ layoutItem: LayoutItem?, with configs: LayoutAnimateConfiguration) {
        
        if configs.setNeedsUpdateConstraints {
            layoutItem?.parent?.setNeedsUpdateConstraints()
        }
        
        UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: configs.duration,
            delay: configs.delay,
            options: configs.options,
            animations: {
                layoutItem?.parent?.layoutIfNeeded()
            },
            completion: configs.completion
        )
        
    }
    
}
