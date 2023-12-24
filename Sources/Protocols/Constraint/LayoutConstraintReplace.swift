//
//  LayoutConstraintReplace.swift
//  Yang
//
//  Created by windy on 2023/12/24.
//

import Foundation

public protocol LayoutConstraintReplaceImpl: LayoutReplacable { }

extension LayoutConstraintReplaceImpl where Self: LayoutOldConstraintProtocol {
    
    public func replaceIfCan() {
        let shouldActive = LayoutConstraintUpdater.replaceIfCan(
            old: oldConstraint, new: constraint
        )
        if shouldActive { constraint.active() }
    }
    
    public func replaceAnimateIfCan(configs: LayoutAnimateConfiguration, isAnimated: Bool) {
        
        replaceIfCan()
        
        if isAnimated {
            LayoutConstraintUpdater.animate(
                constraint.target.target, with: configs
            )
        }
    }
    
}
