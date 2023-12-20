//
//  LayoutConstraintOffset.swift
//  Yang
//
//  Created by windy on 2023/12/20.
//

import Foundation

public protocol LayoutConstraintOffsetImpl: LayoutContantParameter { }

extension LayoutConstraintOffsetImpl where Self.ContantReturn == Void {
    
    public func offset(_ value: LayoutContantOffsetValue) {
        constraint.formula.constant = value.yangContantOffsetValue
    }
    
    public func offsetPoint(_ value: LayoutContantPointValue) {
        constraint.formula.constant = value.yangContantPointValue
    }
    
    public func offsetSize(_ value: LayoutContantSizeValue) {
        constraint.formula.constant = value.yangContantSizeValue
    }
    
    public func offsetEdge(_ value: LayoutContantEdgeValue) {
        constraint.formula.constant = value.yangContantEdgeValue
    }
    
}

extension LayoutConstraintOffsetImpl where Self.ContantReturn == Self {
    
    @discardableResult
    public func offset(_ value: LayoutContantOffsetValue) -> Self {
        constraint.formula.constant = value.yangContantOffsetValue
        return self
    }
    
    @discardableResult
    public func offsetPoint(_ value: LayoutContantPointValue) -> Self {
        constraint.formula.constant = value.yangContantPointValue
        return self
    }
    
    @discardableResult
    public func offsetSize(_ value: LayoutContantSizeValue) -> Self {
        constraint.formula.constant = value.yangContantSizeValue
        return self
    }
    
    @discardableResult
    public func offsetEdge(_ value: LayoutContantEdgeValue) -> Self {
        constraint.formula.constant = value.yangContantEdgeValue
        return self
    }
    
}
