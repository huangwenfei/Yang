//
//  LayoutConstraint+Offset.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

extension LayoutConstraint: LayoutContantParameter {
    
    @discardableResult
    public func offset(_ value: LayoutContantOffsetValue) -> LayoutConstraint {
        formula.constant = value.yangContantOffsetValue
        return self
    }
    
    @discardableResult
    public func offsetPoint(_ value: LayoutContantPointValue) -> LayoutConstraint {
        formula.constant = value.yangContantPointValue
        return self
    }
    
    @discardableResult
    public func offsetSize(_ value: LayoutContantSizeValue) -> LayoutConstraint {
        formula.constant = value.yangContantSizeValue
        return self
    }
    
    @discardableResult
    public func offsetEdge(_ value: LayoutContantEdgeValue) -> LayoutConstraint {
        formula.constant = value.yangContantEdgeValue
        return self
    }
    
}
