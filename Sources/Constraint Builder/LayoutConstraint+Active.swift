//
//  LayoutConstraint+Active.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

extension LayoutConstraint: LayoutActiveParameter {
    
    @discardableResult
    public func active() -> LayoutConstraint {
        buildConstraints()
        activeConstraints()
        cache()
        return self
    }
    
    @discardableResult
    public func deactive() -> LayoutConstraint {
        deactiveConstraints()
        clean()
        removeConstraints()
        return self
    }
    
}

