//
//  LayoutConstraintUpdater.swift
//  Yang
//
//  Created by windy on 2023/12/23.
//

import Foundation

internal struct LayoutConstraintUpdater {
    
    internal static func diffUpdate(old: LayoutConstraint, new: LayoutConstraint) {
        
        guard old.isActive else { return }
        
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
        
    }
    
}
