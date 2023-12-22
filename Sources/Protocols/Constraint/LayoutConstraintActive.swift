//
//  LayoutConstraintActive.swift
//  Yang
//
//  Created by windy on 2023/12/20.
//

import Foundation

public protocol LayoutConstraintActiveImpl: LayoutActiveParameter { }

extension LayoutConstraintActiveImpl {
    internal func _active() {
        constraint.buildConstraints()
        constraint.activeConstraints()
        constraint.cacheConstraint()
    }
    
    internal func _deactive() {
        constraint.deactiveConstraints()
        constraint.cleanConstraint()
        constraint.removeConstraints()
    }
}

extension LayoutConstraintActiveImpl where Self.ActiveReturn == Void {
    
    public func active() {
        _active()
    }
    
    public func deactive() {
        _deactive()
    }
    
}

extension LayoutConstraintActiveImpl where Self.ActiveReturn == Self {
    
    @discardableResult
    public func active() -> ActiveReturn {
        _active()
        return self
    }
    
    @discardableResult
    public func deactive() -> ActiveReturn {
        _deactive()
        return self
    }
    
}

extension LayoutConstraintActiveImpl where Self.ActiveReturn: LayoutConstraintProtocol {
    
    @discardableResult
    public func active() -> ActiveReturn {
        _active()
        return self as! Self.ActiveReturn
    }
    
    @discardableResult
    public func deactive() -> ActiveReturn {
        _deactive()
        return self as! Self.ActiveReturn
    }
    
}

